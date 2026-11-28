# Terraform AWS infrastructure implementation plan

Target resources:
- VPC across at least two Availability Zones
- Public subnets for load balancer and private subnets for worker nodes
- NAT egress or VPC endpoints selected after cost/security review
- Least-privilege IAM roles for EKS nodes and CI/CD
- ECR repository with image scanning and lifecycle policy
- EKS cluster and managed node group
- RDS in private subnets with encryption and backups

Safe workflow:
1. Configure AWS credentials using IAM role or short-lived SSO.
2. Set region and resource naming in an untracked tfvars file.
3. Configure encrypted remote state and locking for team workflows.
4. Run terraform init, terraform fmt -check, terraform validate and terraform plan.
5. Review cost, IAM and network exposure before apply.
6. Run terraform destroy after the lab when resources are no longer needed.

Never commit AWS keys, state files, real tfvars or account-specific secrets. EKS, NAT gateways and RDS can generate charges even while idle.
