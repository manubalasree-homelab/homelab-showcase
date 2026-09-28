# homelab-showcase

A public excerpt of a real homelab GitOps/observability platform, built on a
Mini PC running LXD + Rancher/k3s, entirely without cloud costs. The full
working repos (`sre-helm`, `sre-gitops-bootstrap`) are private — this repo
mirrors their actual chart/config content, minus internal working docs
(architecture decision records, incident logs, blog drafts).

- **`sre-gitops-bootstrap/`** — the app-of-apps root, per-environment values,
  and the bootstrap Applications ArgoCD watches.
- **`sre-helm/`** — every Helm chart and cluster-specific values file the
  platform runs: Istio, kube-prometheus-stack, Thanos, Loki, Tempo, Grafana,
  ArgoCD, MetalLB, OpenBao, and the Bookinfo demo app with its SLO/SLA
  alerting.

`CONTEXT.md` (vocabulary: Environment/Cluster/Provider/Component) and
`ROADMAP.md` (build phases) live inside `sre-gitops-bootstrap/` and are the
best starting points for understanding how this fits together.

The fuller story — why each decision was made, what broke and how it got
fixed — is written up as a [blog](https://blog.virtmicro.com/sre/homelab/building-an-observability-platform/) series, not duplicated here.
