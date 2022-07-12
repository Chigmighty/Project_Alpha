# Configuration section for vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = { Name = "${var.env}"
  }
}

# Configuration section for internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}_igw"
  }
}
# Configuration section for Elastic IP used by NAT Gateway
resource "aws_eip" "nat_eip_a" {
  vpc = true

  tags = {
    Name = "${var.env}_nat_eip_a"
  }
}

# Configuration section for NAT Gateway
# Subnet used by NAT Gateway is the first index public subnet in each AZ
resource "aws_nat_gateway" "nat_gateway_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = aws_subnet.public_subnet_az_a[0].id

  tags = {
    Name = format(
      "nat_${var.env}_gateway_a"
    )
  }
  depends_on = [aws_internet_gateway.igw]
}