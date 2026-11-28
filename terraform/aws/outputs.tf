output "vpc_id" {
  value       = aws_vpc.main.id
  description = "Created VPC ID"
}
output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID"
}
output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "Private subnet ID"
}