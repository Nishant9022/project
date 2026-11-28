# Interview Guide — Multi-Cloud DevOps Automation Platform

## 60-second project explanation

I built a portfolio lab to demonstrate an application delivery workflow across cloud environments. The demo is a small Flask health API. GitHub Actions runs tests and builds a Docker image, then publishes it to GitHub Container Registry on pushes to the main branch. Kubernetes manifests define two replicas, a ClusterIP service, resource requests and limits, and readiness and liveness probes. Separate Terraform examples demonstrate basic network foundations in AWS and Azure. The cloud examples are independent and are applied only after reviewing the plan and cost. I use the health endpoint and Kubernetes rollout status to verify the application.

Be transparent: explain which parts you personally ran. Do not call the cloud infrastructure production or live unless you have deployed it and can show evidence.

## Architecture walkthrough
1. Developer pushes code or opens a pull request.
2. GitHub Actions installs dependencies and runs pytest.
3. Docker builds the application image.
4. On a push to main, the workflow authenticates to GHCR using the GitHub Actions token and pushes the image.
5. An operator updates the Kubernetes image reference and applies the manifests to EKS or AKS.
6. Readiness/liveness probes and rollout status help verify service health.
7. Terraform examples provide separate AWS and Azure network foundations.

## Common interview questions

### Why use Docker?
Docker packages the application and its dependencies into a repeatable image, reducing differences between development and deployment environments.

### Readiness vs liveness probes?
Readiness determines whether a pod should receive traffic. Liveness detects a stuck or unhealthy container and can trigger a restart.

### Why use two replicas?
Two replicas provide basic availability if one pod becomes unavailable. Production replica counts should be based on capacity, availability and workload requirements.

### What does Terraform do here?
Terraform describes infrastructure as code. I run format, validation and plan first, review proposed changes, and apply only with the correct credentials and approval.

### How would you secure CI/CD secrets?
Use GitHub Actions secrets or a cloud secret manager, prefer short-lived identity federation, apply least privilege, rotate credentials, and never print secrets in logs or commit them to Git.

### How would you troubleshoot a failed Kubernetes deployment?
Check pod status, describe the pod, inspect logs and events, verify image name and pull permissions, probes, resource limits, service selectors and rollout status.

### How would you troubleshoot a failed pipeline?
Identify the failing job and step, inspect logs, reproduce locally, verify dependency versions and permissions, fix the root cause, rerun tests, and document the incident.

### How do AWS and Azure differ in this lab?
The examples are separate provider configurations. AWS uses a VPC and subnets; Azure uses a resource group, virtual network and subnets. The app/container workflow is portable, while identity, networking, registry and managed Kubernetes configuration are cloud-specific.

## Demonstration checklist
- [ ] Show a successful GitHub Actions run.
- [ ] Show the Docker image built locally or published to GHCR.
- [ ] Show /health returning HTTP 200.
- [ ] Show Kubernetes pods and rollout status after deploying to a lab cluster.
- [ ] Show Terraform fmt and validate output for the cloud example you actually tested.
- [ ] Explain one issue you encountered and how you resolved it.