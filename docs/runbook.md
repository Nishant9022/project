# Operations Runbook

## Local service check

    curl -i http://localhost:8080/health

Expected: HTTP 200 and JSON containing status=healthy.

## Container checks

    docker build -t cloud-ops-demo:local .
    docker run --rm -d --name cloud-ops-demo -p 8080:8080 cloud-ops-demo:local
    docker logs cloud-ops-demo
    docker stop cloud-ops-demo

## Kubernetes checks

    kubectl apply -f k8s/
    kubectl get deploy,pods,svc
    kubectl rollout status deployment/cloud-ops-demo
    kubectl describe deployment cloud-ops-demo
    kubectl logs deployment/cloud-ops-demo
    kubectl port-forward svc/cloud-ops-demo 8080:80

If pods are not ready, inspect events and pod details. Check that the image reference is correct and accessible, then verify probes, port 8080, resource limits and service selectors.

## Terraform checks

    terraform fmt -check
    terraform init
    terraform validate
    terraform plan

Review all proposed resources and cost implications before applying. Use a secured remote state backend for shared environments. Destroy lab resources when finished and verify the resources are removed.

## Incident notes template
- Time detected:
- Environment / commit:
- User impact:
- Alert or symptom:
- Investigation commands and findings:
- Root cause:
- Resolution / rollback:
- Validation after fix:
- Preventive action: