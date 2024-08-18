output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "private_instance_sg_id" {
  value = module.private_instance_sg.sg_id
}