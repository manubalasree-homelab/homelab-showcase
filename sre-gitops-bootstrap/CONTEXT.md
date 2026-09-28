# Homelab GitOps Platform

Shared vocabulary for the two-repo GitOps platform (`sre-helm` + `sre-gitops-bootstrap`) that deploys workloads to Kubernetes clusters via ArgoCD. This is the canonical glossary for both repos.

## Language

**Environment**:
A named deployment lifecycle stage (`lab`, later `dev`, `prod`), defined by one `envs/<env>/values.yaml` in this repo. Owns which Components are enabled and which Clusters belong to it. Carries no values of its own in `sre-helm` — see Cluster.
_Avoid_: Stage, tier

**Cluster**:
A single Kubernetes control plane, named `<provider>-<env>-<region>-<nn>` (e.g. `lxd-lab-home-01`). Registered under exactly one Environment. The innermost layering unit in `sre-helm/values/clusters/<cluster>/`. Whether it runs its own ArgoCD or is managed by a Hub's depends on Provider — see Hub.
_Avoid_: Context (conflicts with kubeconfig context), node

**Provider**:
The substrate a Cluster runs on (`lxd`, later `aws`, `azure`). Supplies the middle values layer (`sre-helm/values/providers/<provider>/`) for substrate-specific config: storage class, IAM, load balancer.
_Avoid_: Cloud, platform

**Component**:
One installable unit — always exactly one Helm chart, mapped to exactly one ArgoCD Application named `<component>-<cluster>`. Enabled per Environment in `envs/<env>/values.yaml`. A unit that needs multiple charts is modeled as multiple Components, never bundled under one enable flag.
_Avoid_: Service, app, workload

**Values layering**:
The merge order `common → provider → cluster` applied to a Component's values file in `sre-helm`; later layers win, missing files are skipped silently. Environment is not a layer in this chain — see Environment. A chart's own defaults must stay generic enough to mean something on any cluster; anything tuned to one cluster's real constraints belongs in the cluster layer instead, never edited into the chart itself (ADR-0014).

**Hub**:
The Cluster a Provider's ArgoCD instance actually runs on. For `lxd` (single-cluster, no fleet), every Cluster is its own Hub (ADR-0003). For cloud Providers with a real fleet (`aws`, `azure`), one dedicated control Cluster per account/subscription is the Hub, managing sibling Clusters as registered remote targets (ADR-0006) — those sibling Clusters are Spokes, never Hubs themselves.
_Avoid_: Management cluster, control plane (conflicts with the Kubernetes term)

**Root**:
The ArgoCD Application, one per Hub (`bootstrap/roots/<hub>.yaml`), applied by hand once during that Hub's bootstrap, that renders the `app-of-apps` chart against its owning Environment's values. For `lxd`, Hub = Cluster, so this reads as "one per Cluster." For cloud Providers, one Hub's Root renders Applications spanning every Spoke registered to it, not just itself.
_Avoid_: Bootstrap app

**AppProject**:
The ArgoCD RBAC/scoping boundary, one per Hub (created inside that Hub's ArgoCD instance by the `app-of-apps` chart's `project.yaml` template) — never shared across Hubs, since ArgoCD instances aren't shared. A Hub managing multiple Spokes still has just one AppProject, scoping all of them.
_Avoid_: Project (ambiguous with the platform itself)
