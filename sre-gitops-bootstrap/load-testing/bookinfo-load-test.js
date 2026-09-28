// Load test for Bookinfo's productpage — proves the HPA in
// sre-helm/charts/bookinfo (docs/incidents.md #21) actually scales under
// real traffic. Target is parameterized so the same script works both ways:
//
//   in-cluster (internal Service, no mesh hop):
//     k6 run -e TARGET=http://productpage.bookinfo.svc.cluster.local:9080 bookinfo-load-test.js
//
//   from a laptop (external hostname, through the Istio gateway):
//     k6 run -e TARGET=https://bookinfo.lab bookinfo-load-test.js
//
// See job.yaml for the in-cluster variant wired up as a one-off Job.
import http from 'k6/http';
import { check, sleep } from 'k6';

const TARGET = __ENV.TARGET || 'http://productpage.bookinfo.svc.cluster.local:9080';

export const options = {
  insecureSkipTLSVerify: true, // lab-ca is a self-signed root — fine for a load test hitting bookinfo.lab
  stages: [
    { duration: '30s', target: 50 }, // ramp 0 -> 50 VUs
    { duration: '2m', target: 50 },  // hold — long enough for the HPA's default sync loop to observe sustained pressure and scale
    { duration: '30s', target: 0 },  // ramp down — also worth watching: does it scale back in afterward?
  ],
};

export default function () {
  const res = http.get(`${TARGET}/productpage`);
  check(res, { 'status is 200': (r) => r.status === 200 });
  sleep(0.1);
}
