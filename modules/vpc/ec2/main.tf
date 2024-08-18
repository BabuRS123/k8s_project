resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  associate_public_ip_address = false

  tags = {
    Name = var.instance_name
  }
}