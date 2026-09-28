# [1.38.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.37.0...v1.38.0) (2026-09-27)


### Features

* **secrets:** add secrets-store chart — ClusterSecretStore + ExternalSecret (ADR-0017) ([3818381](https://github.com/manubalasree-homelab/sre-helm/commit/3818381bbe0cbcc177e7aab04383ea21042b50ff)), closes [#24](https://github.com/manubalasree-homelab/sre-helm/issues/24)

# [1.37.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.36.0...v1.37.0) (2026-09-27)


### Features

* **secrets:** vendor OpenBao + External Secrets Operator (ADR-0017) ([8581f18](https://github.com/manubalasree-homelab/sre-helm/commit/8581f188b5d9b0daf072b4950a65d35dcaf28ff0)), closes [#24-era](https://github.com/manubalasree-homelab/sre-helm/issues/24-era)

# [1.36.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.35.0...v1.36.0) (2026-09-27)


### Features

* **grafana:** enable image-renderer as a separate service, not the in-process plugin ([472a710](https://github.com/manubalasree-homelab/sre-helm/commit/472a71034a52ce60ed9b8833a2e0b62a35a45764))

# [1.35.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.34.0...v1.35.0) (2026-09-27)


### Features

* **retention:** prometheus to 3d, thanos raw to 5d ([8f8c16e](https://github.com/manubalasree-homelab/sre-helm/commit/8f8c16e03f0b6dd63bfc5f894419f7089d4397c1))

# [1.34.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.33.0...v1.34.0) (2026-09-27)


### Features

* **bookinfo:** tighten SLO to 99.5%, keep the 99% SLA as an external buffer ([e6c42d2](https://github.com/manubalasree-homelab/sre-helm/commit/e6c42d2da73149ef06aeb994938baaf1f658c411))

# [1.33.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.32.0...v1.33.0) (2026-09-27)


### Features

* **bookinfo:** add SLO/error-budget row to the Grafana dashboard ([0664dbf](https://github.com/manubalasree-homelab/sre-helm/commit/0664dbf50f17d83f5768c4e42591943f0da86bd9))

# [1.32.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.31.0...v1.32.0) (2026-09-27)


### Features

* **bookinfo:** SLO burn-rate alerting for productpage availability (99% SLO) ([6644de0](https://github.com/manubalasree-homelab/sre-helm/commit/6644de0e9dac506373d38e1a3c18a43fbf6975b0))

# [1.31.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.30.0...v1.31.0) (2026-09-27)


### Features

* **bookinfo:** add a Grafana dashboard (p99 latency, request rate, HPA replicas) ([3b9f6f0](https://github.com/manubalasree-homelab/sre-helm/commit/3b9f6f0141014e1d9176dc7de4ffa812ebadf36f))

# [1.30.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.29.0...v1.30.0) (2026-09-27)


### Features

* **bookinfo:** pre-compute p99 latency as a recording rule ([e800c8b](https://github.com/manubalasree-homelab/sre-helm/commit/e800c8b358baab9591880c9e77a18f7fc94480db))

# [1.29.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.28.0...v1.29.0) (2026-09-26)


### Features

* **tempo:** enable metrics-generator local-blocks processor ([e687d3a](https://github.com/manubalasree-homelab/sre-helm/commit/e687d3a283e1b0d89e4b213beb4c87cb937584ba))

# [1.28.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.27.0...v1.28.0) (2026-09-26)


### Features

* **retention:** prometheus to 2d, loki to 1 week ([9606b88](https://github.com/manubalasree-homelab/sre-helm/commit/9606b8829a76087e66a821faf9cf502ab561aa13))

# [1.27.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.26.0...v1.27.0) (2026-09-26)


### Features

* **alertmanager:** route alerts to Slack instead of in-UI only ([3357f4a](https://github.com/manubalasree-homelab/sre-helm/commit/3357f4a73aed7e12efd73c3092f6561d3412a81d))

# [1.26.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.25.2...v1.26.0) (2026-09-26)


### Features

* **retention:** shrink prometheus local retention to 4h, cap loki at 4d ([c10f92a](https://github.com/manubalasree-homelab/sre-helm/commit/c10f92ad013a8479c064b6a33fac30ff280c94e2))

## [1.25.2](https://github.com/manubalasree-homelab/sre-helm/compare/v1.25.1...v1.25.2) (2026-09-26)


### Bug Fixes

* **thanos:** move compactor retention out of chart defaults into cluster values ([2883388](https://github.com/manubalasree-homelab/sre-helm/commit/2883388206c064aa6d3eb7f6e006b0fb764869dc))

## [1.25.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.25.0...v1.25.1) (2026-09-26)


### Bug Fixes

* **thanos:** only raw retention can be 3d, not 5m/1h ([aa386c0](https://github.com/manubalasree-homelab/sre-helm/commit/aa386c040645de2603d4fe345beec1efa9fa33e2))

# [1.25.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.24.0...v1.25.0) (2026-09-26)


### Features

* **thanos:** set compactor retention to 3 days ([49fef0e](https://github.com/manubalasree-homelab/sre-helm/commit/49fef0edb9d8d6ab03e23c43f1bfb15955a89b87))

# [1.24.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.23.0...v1.24.0) (2026-09-26)


### Features

* **istio-injection:** add bookinfo namespace ([7c9866a](https://github.com/manubalasree-homelab/sre-helm/commit/7c9866a83cf2935d46f66e2b42bfc474cc9c9b09))

# [1.23.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.22.2...v1.23.0) (2026-09-26)


### Features

* **bookinfo:** add Istio's Bookinfo sample app with HPA on productpage ([62ec07b](https://github.com/manubalasree-homelab/sre-helm/commit/62ec07b1aa61292550e22272425f2ebb98a1fca7)), closes [#21](https://github.com/manubalasree-homelab/sre-helm/issues/21)

## [1.22.2](https://github.com/manubalasree-homelab/sre-helm/compare/v1.22.1...v1.22.2) (2026-09-25)


### Bug Fixes

* **kube-prometheus-stack:** exclude Prometheus from sidecar injection ([ce5a55a](https://github.com/manubalasree-homelab/sre-helm/commit/ce5a55a432a546344ddff11f3d1786598673b4b6)), closes [#20](https://github.com/manubalasree-homelab/sre-helm/issues/20)

## [1.22.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.22.0...v1.22.1) (2026-09-25)


### Bug Fixes

* **istio:** resolve the istio_requests_total gap (incident [#14](https://github.com/manubalasree-homelab/sre-helm/issues/14)) ([c3c7211](https://github.com/manubalasree-homelab/sre-helm/commit/c3c7211753488835b6c4ed5a0cc057be03497550))

# [1.22.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.21.1...v1.22.0) (2026-09-25)


### Features

* **istio-monitors:** scrape every sidecar's own Envoy stats ([c6e6e69](https://github.com/manubalasree-homelab/sre-helm/commit/c6e6e6972a0f133a9aa1ecf1d28f88e18b7a2994))

## [1.21.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.21.0...v1.21.1) (2026-09-25)


### Bug Fixes

* **kiali:** wire prometheus and grafana external_services ([66a46e2](https://github.com/manubalasree-homelab/sre-helm/commit/66a46e26d7950c3e0bde8b8d5e4b31580f9e9e83))

# [1.21.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.20.0...v1.21.0) (2026-09-25)


### Features

* **istio-injection:** expand sidecar injection to every managed workload ([5e3f9ef](https://github.com/manubalasree-homelab/sre-helm/commit/5e3f9ef2f10bb402e7f091164bc5361062306992))

# [1.20.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.19.0...v1.20.0) (2026-09-25)


### Features

* **istio-injection:** enable sidecar injection for gateway-routed apps ([b9ab576](https://github.com/manubalasree-homelab/sre-helm/commit/b9ab57634e79219ce25e7157371c289a51dec9b0))

# [1.19.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.18.0...v1.19.0) (2026-09-25)


### Features

* **istio-monitors:** scrape ingress gateway + Kiali metrics ([dcac980](https://github.com/manubalasree-homelab/sre-helm/commit/dcac98047106ff9ec1988188672a309ebc22dede))

# [1.18.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.17.1...v1.18.0) (2026-09-25)


### Features

* **grafana:** add Thanos Query as a datasource ([86c2e90](https://github.com/manubalasree-homelab/sre-helm/commit/86c2e90f1ff3dbdb109210f24a23ead34ad2d1dd))

## [1.17.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.17.0...v1.17.1) (2026-09-25)


### Bug Fixes

* **thanos:** use --endpoint instead of --store ([156814a](https://github.com/manubalasree-homelab/sre-helm/commit/156814a018235f74d729f883d1770f60d6f76b85))

# [1.17.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.16.0...v1.17.0) (2026-09-25)


### Features

* **thanos:** add Thanos Query/StoreGateway/Compactor + Prometheus sidecar ([759d909](https://github.com/manubalasree-homelab/sre-helm/commit/759d909242a8e489547cb3efc4e73ec5f67a7484))

# [1.16.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.15.2...v1.16.0) (2026-09-25)


### Features

* **grafana:** add Loki as a datasource ([dcb7e3b](https://github.com/manubalasree-homelab/sre-helm/commit/dcb7e3bdee3c3175dbdb70922eda03ebcf48279f))

## [1.15.2](https://github.com/manubalasree-homelab/sre-helm/compare/v1.15.1...v1.15.2) (2026-09-25)


### Bug Fixes

* **vector:** tail new logs only, don't replay on-disk backlog ([551c6c3](https://github.com/manubalasree-homelab/sre-helm/commit/551c6c351251909d9dcad8df70bbdfffde980418))

## [1.15.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.15.0...v1.15.1) (2026-09-25)


### Bug Fixes

* **loki:** disable memcached chunks/results caches ([fb674ec](https://github.com/manubalasree-homelab/sre-helm/commit/fb674ec4141c3daea25ea3c35a31cf0e0147b718))

# [1.15.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.14.1...v1.15.0) (2026-09-25)


### Features

* **loki,vector:** vendor loki + vector, wire logs into versitygw S3 ([b926cbf](https://github.com/manubalasree-homelab/sre-helm/commit/b926cbffda2abed35615588893454e1009fa8712))

## [1.14.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.14.0...v1.14.1) (2026-09-25)


### Bug Fixes

* pin Grafana's admin credentials to a hand-applied secret ([e856a78](https://github.com/manubalasree-homelab/sre-helm/commit/e856a78239a08d9635d33d54bd82e6d4ac39c207))

# [1.14.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.13.0...v1.14.0) (2026-09-25)


### Features

* add Tempo as a Grafana datasource ([7ffbfe6](https://github.com/manubalasree-homelab/sre-helm/commit/7ffbfe68df8d217e45967842328fcbacc079ee4b))

# [1.13.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.12.0...v1.13.0) (2026-09-25)


### Features

* wire Istio tracing to Tempo ([0c72a1b](https://github.com/manubalasree-homelab/sre-helm/commit/0c72a1bc7edf021b27b37c7a8646554869330e6a))

# [1.12.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.11.0...v1.12.0) (2026-09-25)


### Features

* add Tempo, backed by versitygw's S3 (per ADR-0009's original intent) ([1a853b0](https://github.com/manubalasree-homelab/sre-helm/commit/1a853b08d0581269c50d1f12c75d2cb34dce59be))

# [1.11.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.10.0...v1.11.0) (2026-09-25)


### Features

* add kube-prometheus-stack (Prometheus+Alertmanager+Grafana), Grafana routed via Istio ([ed4c7ad](https://github.com/manubalasree-homelab/sre-helm/commit/ed4c7ada3ea9268c5920c4749c5939a268ad33f2))

# [1.10.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.9.0...v1.10.0) (2026-09-25)


### Features

* add Kiali, routed through Istio at kiali.lab ([9ce84e8](https://github.com/manubalasree-homelab/sre-helm/commit/9ce84e88b0641209eb0f6d189b9cbd85c19fa7e8))

# [1.9.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.8.0...v1.9.0) (2026-09-25)


### Features

* route versitygw's S3 API through Istio too, fix argocd's *-host conflict ([f1ccce5](https://github.com/manubalasree-homelab/sre-helm/commit/f1ccce5f983e8e4412c69ade2270a84a34ed9eb5))

# [1.8.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.7.0...v1.8.0) (2026-09-25)


### Features

* route ArgoCD through the Istio gateway, TLS via lab-ca ([8c5fced](https://github.com/manubalasree-homelab/sre-helm/commit/8c5fced0c249f6d76e7f4c9c4940f886fd222559))

# [1.7.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.6.0...v1.7.0) (2026-09-25)


### Features

* universal chart vendoring with automated update checks ([9d24631](https://github.com/manubalasree-homelab/sre-helm/commit/9d246311e59f236b5de0ded3d9f4e78c6e2db042))

# [1.6.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.5.1...v1.6.0) (2026-09-25)


### Features

* enable versitygw WebUI, pinned to the port-forward endpoint ([055a9da](https://github.com/manubalasree-homelab/sre-helm/commit/055a9da53baa2961798562aefd9ffd3ac040bd90))

## [1.5.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.5.0...v1.5.1) (2026-09-25)


### Bug Fixes

* vendor versitygw to patch the TLS readiness-probe bug ([e1f428c](https://github.com/manubalasree-homelab/sre-helm/commit/e1f428c3282a1f0ce88610ed07de292901a28462))

# [1.5.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.4.1...v1.5.0) (2026-09-25)


### Features

* versitygw values — posix backend, TLS via lab-ca ClusterIssuer ([2ae8b50](https://github.com/manubalasree-homelab/sre-helm/commit/2ae8b50b54404e81e8f7bad7beb1f32c4d4a295b))

## [1.4.1](https://github.com/manubalasree-homelab/sre-helm/compare/v1.4.0...v1.4.1) (2026-09-25)


### Bug Fixes

* lab-ca's Certificate/Issuer must live in cert-manager's own namespace ([305064e](https://github.com/manubalasree-homelab/sre-helm/commit/305064eabf7f3302a7cb1c4da9219909fadb51cc))

# [1.4.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.3.0...v1.4.0) (2026-09-25)


### Features

* add lab-ca chart — self-signed ClusterIssuer for platform apps ([d1f73aa](https://github.com/manubalasree-homelab/sre-helm/commit/d1f73aa63bdc8ff99b638d7820931864e65f2bb9))

# [1.3.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.2.0...v1.3.0) (2026-09-24)


### Features

* add metallb-config chart for the IPAddressPool/L2Advertisement CRs ([aee3f3a](https://github.com/manubalasree-homelab/sre-helm/commit/aee3f3a75bc8d92d7a40ea58707bb3f883286322))

# [1.2.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.1.0...v1.2.0) (2026-09-24)


### Features

* vendor argo-rollouts and argo-workflows chart sources ([886d4d3](https://github.com/manubalasree-homelab/sre-helm/commit/886d4d3cd1ddbd3fdc23b5e46aa7291443b70596))

# [1.1.0](https://github.com/manubalasree-homelab/sre-helm/compare/v1.0.0...v1.1.0) (2026-09-24)


### Features

* vendor the argo-cd chart, controlled updates instead of live upstream pull ([c6bd918](https://github.com/manubalasree-homelab/sre-helm/commit/c6bd918dc007fc467f2a905d8ae2287a06aa5b9e))

# 1.0.0 (2026-09-24)


### Features

* cut the first semantic release for sre-helm ([662919d](https://github.com/manubalasree-homelab/sre-helm/commit/662919d9d6b159c3bdfa0b697b166e8ed2b5518e))
