# Operations Runbook

## Release checklist
- Pull request reviewed and merged
- Unit tests passed
- Image scanned and tagged with an immutable build number
- ECR image digest recorded
- Kubernetes manifest references the intended image
- Deployment rollout completed and health endpoints pass
- Monitoring checked after release

## ImagePullBackOff
1. Run kubectl describe pod POD_NAME.
2. Confirm image URI and tag exist in ECR.
3. Verify node IAM permissions and registry authentication.
4. Check cluster network access to ECR endpoints.
5. Correct the image reference and restart the rollout.

## CrashLoopBackOff
1. Run kubectl logs POD_NAME --previous.
2. Inspect kubectl describe pod POD_NAME for probe failures and exit codes.
3. Verify configuration and resource limits.
4. Reproduce locally using the same image.
5. Roll back if the release caused customer impact.

## Stuck rollout
    kubectl rollout status deployment/retail-api
    kubectl describe deployment/retail-api
    kubectl get events --sort-by=.lastTimestamp
    kubectl rollout history deployment/retail-api

## Roll back a release
    kubectl rollout undo deployment/retail-api
    kubectl rollout status deployment/retail-api

Verify service health, review logs and metrics, and document the incident timeline and root cause.
