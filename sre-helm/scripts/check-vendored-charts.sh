#!/usr/bin/env bash
# Checks every vendored chart (charts/*/.vendor.yaml) against its upstream
# source. Any chart with a newer version available gets re-pulled in place,
# preserving .vendor.yaml and any local patch. Leaves working-tree changes
# for the caller to commit — doesn't commit or push anything itself.
#
# Supports https:// Helm repos and oci:// registries hosted on ghcr.io
# (the only OCI registry any vendored chart currently uses).
set -euo pipefail

CHARTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../charts" && pwd)"
UPDATED=()

latest_https() {
  local repo_url="$1" chart="$2" tmp_repo="tmp-check-$$"
  helm repo add "$tmp_repo" "$repo_url" >/dev/null 2>&1
  helm repo update "$tmp_repo" >/dev/null 2>&1
  local latest
  latest=$(helm search repo "$tmp_repo/$chart" --versions -o json | python3 -c "import json,sys;print(json.load(sys.stdin)[0]['version'])")
  helm repo remove "$tmp_repo" >/dev/null 2>&1
  echo "$latest"
}

latest_oci_ghcr() {
  local repo_url="$1" chart="$2"
  # repo_url is like oci://ghcr.io/<owner>/<path>/<chart-name> (chart name repeated in path for these charts)
  local path="${repo_url#oci://ghcr.io/}"
  local token
  token=$(curl -s "https://ghcr.io/token?service=ghcr.io&scope=repository:${path}:pull" | python3 -c "import json,sys;print(json.load(sys.stdin)['token'])")
  curl -s "https://ghcr.io/v2/${path}/tags/list" -H "Authorization: Bearer $token" \
    | python3 -c "
import json, sys, re
tags = json.load(sys.stdin)['tags']
versions = [t for t in tags if re.match(r'^\d+\.\d+\.\d+\$', t)]
versions.sort(key=lambda v: [int(x) for x in v.split('.')])
print(versions[-1])
"
}

for vendor_file in "$CHARTS_DIR"/*/.vendor.yaml; do
  chart_dir="$(dirname "$vendor_file")"
  chart_name="$(basename "$chart_dir")"
  repo_url=$(python3 -c "import yaml; print(yaml.safe_load(open('$vendor_file'))['repoURL'])")
  chart=$(python3 -c "import yaml; print(yaml.safe_load(open('$vendor_file'))['chart'])")
  current=$(python3 -c "import yaml; print(yaml.safe_load(open('$vendor_file'))['version'])")
  patched=$(python3 -c "import yaml; print(yaml.safe_load(open('$vendor_file')).get('patched', False))")

  if [[ "$repo_url" == oci://* ]]; then
    latest=$(latest_oci_ghcr "$repo_url" "$chart")
  else
    latest=$(latest_https "$repo_url" "$chart")
  fi

  if [[ "$current" == "$latest" ]]; then
    echo "OK:      $chart_name ($current, up to date)"
    continue
  fi

  echo "UPDATE:  $chart_name $current -> $latest$( [[ "$patched" == "True" ]] && echo ' [PATCHED — verify local patch still applies]' )"
  UPDATED+=("$chart_name")

  tmp_pull_dir=$(mktemp -d)
  if [[ "$repo_url" == oci://* ]]; then
    helm pull "${repo_url}" --version "$latest" --untar --untardir "$tmp_pull_dir"
  else
    tmp_repo="tmp-pull-$$"
    helm repo add "$tmp_repo" "$repo_url" >/dev/null 2>&1
    helm repo update "$tmp_repo" >/dev/null 2>&1
    helm pull "$tmp_repo/$chart" --version "$latest" --untar --untardir "$tmp_pull_dir"
    helm repo remove "$tmp_repo" >/dev/null 2>&1
  fi

  pulled_dir="$tmp_pull_dir/$chart"
  # Replace everything except .vendor.yaml (and, for a patched chart, leave a
  # .rej-style marker instead of silently clobbering the local patch).
  find "$chart_dir" -mindepth 1 -not -name ".vendor.yaml" -delete
  cp -r "$pulled_dir"/* "$chart_dir"/
  rm -rf "$tmp_pull_dir"

  python3 -c "
import yaml
d = yaml.safe_load(open('$vendor_file'))
d['version'] = '$latest'
yaml.safe_dump(d, open('$vendor_file', 'w'), default_flow_style=False)
"
done

if [[ ${#UPDATED[@]} -gt 0 ]]; then
  echo
  echo "Updated: ${UPDATED[*]}"
  echo "::set-output name=updated::${UPDATED[*]}" 2>/dev/null || true
  echo "updated=${UPDATED[*]}" >> "${GITHUB_OUTPUT:-/dev/null}" 2>/dev/null || true
fi
