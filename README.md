# Multi-Cloud DevOps Automation Platform

A hands-on DevOps portfolio project exploring repeatable infrastructure and application delivery across AWS and Azure.

> **Project status:** Portfolio/lab work in progress. This repository documents the intended architecture and learning workflow. It is not a claim of production deployment, customer usage, or measured business outcomes.

## Objectives
- Practice Infrastructure as Code with Terraform.
- Build and understand CI/CD workflows with Jenkins.
- Package applications with Docker.
- Deploy and operate workloads with Kubernetes.
- Explore cloud infrastructure patterns across AWS and Azure.
- Document validation, troubleshooting, and operational practices.

## Technology areas

| Area | Tools |
|---|---|
| Cloud | AWS, Microsoft Azure |
| Infrastructure as Code | Terraform |
| CI/CD | Jenkins |
| Containers | Docker |
| Orchestration | Kubernetes |
| OS / scripting | Linux, shell |
| Source control | Git, GitHub |

Only list services and components here that you have personally configured or tested as the project progresses.

## Planned workflow
1. Prepare a Linux development environment and install required tooling.
2. Configure cloud access securely using least-privilege identities; do not commit credentials.
3. Define infrastructure with Terraform and review the plan before applying changes.
4. Build and tag an application container image with Docker.
5. Run CI/CD stages in Jenkins (checkout, validation, build, test, image build, and deployment where configured).
6. Deploy to a Kubernetes environment and validate rollout and service health.
7. Capture logs, test recovery steps, and document issues and resolutions.
8. Clean up lab resources to avoid unnecessary cloud charges.

## Security and cost notes
- Use IAM roles / managed identities and least-privilege permissions.
- Store secrets in an approved secret manager or CI/CD credential store.
- Keep state files and sensitive variable files out of version control.
- Review cloud costs before provisioning and remove unused resources.

## Evidence and status
Add the portfolio PDF, screenshots, pipeline logs, Terraform plans (with secrets removed), and deployment manifests after generating and verifying them. Clearly label anything that is planned, simulated, or lab-tested.

## Author
**Nishant Girase**  
GitHub: [Nishant9022](https://github.com/Nishant9022)
