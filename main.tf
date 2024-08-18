module "vpc" {
  source                = "./modules/vpc"
  cidr_block            = "10.0.0.0/16"
  private_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones    = ["ap-southeast-2a", "ap-southeast-2b"]
  vpc_name              = "my-private-vpc"
  subnet_name_prefix    = "my-private-subnet"
  route_table_name      = "my-private-route-table"
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-03f0544597f43a91d"  # Example AMI ID for Amazon Linux 2
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.private_subnet_ids[0]
  security_group_id = module.private_instance_sg.sg_id
  instance_name     = "my-private-instance"
}

module "private_instance_sg" {
  source             = "./modules/security_group"
  vpc_id             = module.vpc.vpc_id
  bastion_cidr_blocks = ["152.58.244.40/32"]  # Replace with your bastion host CIDR
  sg_name            = "private-instance-sg"
}
module "eks" {
  source           = "./modules/eks"
  cluster_name     = "my-private-eks-cluster"
  node_group_name  = "my-private-node-group"
  private_subnet_ids = module.vpc.private_subnet_ids
  ssh_key_name     = "sample"
  eks_role_arn     = aws_iam_role.eks_role.arn
  node_role_arn    = aws_iam_role.node_role.arn
}