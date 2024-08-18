resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.private_subnet_ids
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name   = aws_eks_cluster.this.name
  node_role_arn  = var.node_role_arn
  subnet_ids     = ["subnet-0088e436ff6df4df9","subnet-0349ebdd01803ec0f"]  # Use subnet_ids here
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}