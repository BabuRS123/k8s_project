resource "aws_vpc" "sample" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "private" {
  count                  = length(var.private_subnet_cidrs)
  vpc_id                 = aws_vpc.sample.id
  cidr_block             = var.private_subnet_cidrs[count.index]
  availability_zone      = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.subnet_name_prefix}-${count.index + 1}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.sample.id

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}