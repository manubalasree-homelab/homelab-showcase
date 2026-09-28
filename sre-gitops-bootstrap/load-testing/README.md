# Load testing

`bookinfo-load-test.js` proves the HPA on Bookinfo's `productpage` (`sre-helm/charts/bookinfo`) actually scales under real traffic — see `docs/incidents.md` #21 for the full design reasoning and `docs/how-bookinfo-and-hpa-works.md` for how it all fits together.

Not an ArgoCD Component, deliberately — this is a test *action* you run when you want to, not a persistent service.

## Run it from your laptop, through the gateway

```sh
k6 run -e TARGET=https://bookinfo.lab load-testing/bookinfo-load-test.js
```

Tests the real path a user would hit — TLS termination, SNI routing, the mTLS hop to `productpage`'s own sidecar, all of it.

## Run it in-cluster, against the internal Service directly

```sh
kubectl create namespace bookinfo-load-test --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -f load-testing/job.yaml
kubectl logs -n bookinfo-load-test -f job/bookinfo-load-test
kubectl delete -f load-testing/job.yaml   # cleanup, or re-apply to run again
```

Isolates "does the HPA loop actually work" from "does the mesh add overhead" — no gateway hop involved.

## Watching it scale, while a test is running

```sh
kubectl get hpa productpage -n bookinfo -w
kubectl get pods -n bookinfo -l app=productpage -w
```
