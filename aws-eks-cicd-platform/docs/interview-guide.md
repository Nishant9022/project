# Interview Guide — AWS EKS CI/CD Platform

## 90-second project explanation
I built a personal AWS DevOps portfolio lab around a sample retail API. The goal was to model a repeatable application delivery workflow. I containerized the Python API with Docker, created Kubernetes manifests for deployment, service, health probes and autoscaling, and wrote a Jenkins declarative pipeline for test and image-build stages. The target runtime is Amazon EKS in private subnets, with an Application Load Balancer as the entry point. Terraform describes the AWS foundation. I documented rollout verification, common pod failures and rollback commands. I clearly separate components I have run in my lab from infrastructure that remains a planned extension.

## Interview questions
1. Why EKS? It provides a managed Kubernetes control plane; the team still manages workload configuration, worker capacity, security and upgrades.
2. Why ECR? It is a managed image registry integrated with AWS IAM and EKS. Use immutable tags and scan images before release.
3. How do you reduce deployment downtime? Use multiple replicas, readiness probes, rolling updates and rollout health checks. Confirm capacity and backward compatibility.
4. Readiness vs liveness? Readiness controls whether a pod receives traffic. Liveness detects a stuck process that may need restarting.
5. How do you troubleshoot ImagePullBackOff? Check image name/tag, registry, node IAM permissions, authentication, network access and pod events.
6. How do you roll back? Inspect rollout history, run kubectl rollout undo deployment/retail-api, verify health and investigate the failed release.
7. How do you secure Jenkins? Use least-privilege roles, short-lived credentials, a credentials store, restricted agents, plugin governance, RBAC and audit logs.
8. How do you secure Terraform state? Use an encrypted remote backend, restricted access, versioning and locking. Never commit state or secrets.
9. How do you troubleshoot high CPU? Compare pod metrics, inspect logs and traffic, check requests/limits and HPA behavior, then scale or roll back based on evidence.
10. How do you reduce AWS cost? Right-size node groups, autoscale, schedule non-production environments, set budgets and remove unused lab resources.

## Demonstrations to practise
- pytest -q app/tests
- docker build -f docker/Dockerfile -t retail-api:demo .
- kubectl get pods,svc,hpa
- kubectl rollout history deployment/retail-api
- terraform fmt -check and terraform validate

Do not claim a command succeeded until you have run it and can show the output.
