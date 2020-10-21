resource "aws_vpc" "main" {
  cidr_block = var.VPC_CIDR
}

resource "aws_subnet" "private-subnets" {
  count = length(var.PRIVATE_SUBNETS)
  cidr_block = element(var.PRIVATE_SUBNETS, count.index)
  vpc_id = aws_vpc.main.id
}

