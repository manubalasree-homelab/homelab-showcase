# Roadmap

Updated phase plan for the homelab GitOps platform. Vocabulary is defined in [`CONTEXT.md`](./CONTEXT.md); the rationale behind why MetalLB/Istio moved earlier and Traefik stays permanently is in [`docs/adr/0004`](./docs/adr/0004-traefik-and-istio-coexist.md) and [`docs/adr/0005`](./docs/adr/0005-metallb-istio-pulled-into-v0.1.md).

**v0.1 scope is now Phase 0–2** (was Phase 0–1): a commit to `sre-helm` changes something running in the `lab` Cluster with no manual `helm`/`kubectl apply`, and ArgoCD itself is reachable through Istio's gateway rather than staying on `port-forward` long-term.

## Non-goals (v0.1), updated

Built later, but the layout must already have a place for them:

- AWS / Azure clusters
- Multi-cluster from one ArgoCD (hub-and-spoke) — superseded by ADR-0003: ArgoCD is per-Cluster, never shared, so this is now a non-question rather than a deferred one
- Istio's tracing/mesh use — mesh-wide sidecar injection, a dedicated OTel Collector (Tempo itself, and Istio's own native OTel tracing export straight to it, are **no longer** non-goals — see ADR-0005 and Phase 6 below)
- Long-term metrics (Thanos) — **no longer** a non-goal, see Phase 5 below
- TLS via public/ACME certs, SSO, external DNS — internal TLS via the self-signed `lab-ca` ClusterIssuer is **no longer** a non-goal (ADR-0008)
- CI pipelines (lint/test) — a `helm lint`/`helm template` check on `charts/app-of-apps` is **no longer** a non-goal, see `.github/workflows/lint.yml`; real integration/e2e testing against a live cluster is still out of scope
- Rancher — considered, dropped; not a real requirement

## Phases

| Phase | Adds | Proves |
|---|---|---|
| **0** | LXD VM + k3s (`lxd-lab-home-01`); Traefik left enabled, unused (ADR-0004) | `kubectl get nodes` from laptop |
| **1** | ArgoCD + `lab` Root + `hello` | Git commit → cluster change (**v0.1 core done**); ArgoCD reachable via `kubectl port-forward` |
| **2** | MetalLB (L2Advertisement, `192.168.2.220-230`) + Istio (`istio-base` → `istiod` → `istio-ingressgateway`, sync-wave ordered) | ArgoCD reachable via the Istio Gateway's MetalLB IP, pure IP — no DNS (**v0.1 done**) |
| 3 | kube-prometheus-stack (Prometheus + Alertmanager + Grafana) | Dashboards (**done**) |
| 4 | versitygw (replaces MinIO, ADR-0009) + Loki + Vector | Logs in Grafana (**done**) |
| 5 | Thanos (Query + Store Gateway + Compactor, hand-written chart — no free vendorable chart exists, see docs/incidents.md #13) | Metrics history in versitygw (**wiring done**; no >15d-old data yet to prove long-term querying against, since Thanos only just started shipping blocks) |
| 6 | Tempo (**done**, via Istio's own native OTel tracing export — no separate OTel Collector deployed; sufficient for what's actually emitting traces today) | Traces in Grafana (**done**; Istio itself already live since Phase 2 — this wired up its telemetry) |
| 7 | Second env or second Cluster | Layout scales without restructuring; a second Cluster gets its own Root + AppProject + its own ArgoCD instance (ADR-0003, no hub-and-spoke) |
| 8 | AWS cluster (EKS) | Provider layer works; S3 instead of versitygw |
| 9 | Azure cluster (AKS) | Same, with Blob |
