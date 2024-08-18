output "eks_cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.this.id
}

output "eks_node_group_id" {
  description = "EKS Node Group ID"
  value       = aws_eks_node_group.this.id
}