variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "bastion_cidr_blocks" {
  description = "The CIDR blocks allowed to access the instance (usually the CIDR of the bastion host)"
  type        = list(string)
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
}