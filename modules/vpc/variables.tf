variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnet_name_prefix" {
  description = "The prefix for the names of the private subnets"
  type        = string
}

variable "route_table_name" {
  description = "The name of the route table"
  type        = string
}