output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.sample.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}