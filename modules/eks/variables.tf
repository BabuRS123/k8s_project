variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "SSH key name for accessing nodes"
  type        = string
}

# Define IAM roles in a separate IAM module
variable "eks_role_arn" {
  description = "ARN of the EKS role"
  type        = string
}

variable "node_role_arn" {
  description = "ARN of the node role"
  type        = string
}