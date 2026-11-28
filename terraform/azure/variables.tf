variable "location" {
  description = "Azure region for the lab network"
  type        = string
  default     = "Central India"
}
variable "project_name" {
  description = "Prefix used for lab resources"
  type        = string
  default     = "cloud-ops-demo"
}