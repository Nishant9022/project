variable "aws_region" {
  description = "AWS region for the lab network"
  type        = string
  default     = "ap-south-1"
}
variable "project_name" {
  description = "Prefix used for lab resources"
  type        = string
  default     = "cloud-ops-demo"
}