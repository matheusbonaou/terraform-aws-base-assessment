resource "aws_vpc" "vpc_default" {
  cidr_block = var.aws_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true


  tags = {
    Name = "vpc-${var.environment}"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc_default.id

  tags = {
    Name = "ig-${var.environment}"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway_attachment" "ig_vpc_attach" {
  internet_gateway_id = aws_internet_gateway.internet_gw.id
  vpc_id              = aws_vpc.vpc_default.id
}

resource "aws_default_security_group" "sg_default" {
  vpc_id = aws_vpc.vpc_default.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "subnet-public-a" {
  vpc_id     = aws_vpc.vpc_default.id
  cidr_block = var.aws_subnet_public_a_cidr

  tags = {
    Name = "subnet-${var.environment}-public-subnet-a"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "subnet-public-b" {
  vpc_id     = aws_vpc.vpc_default.id
  cidr_block = var.aws_subnet_public_b_cidr

  tags = {
    Name = "subnet-${var.environment}-public-subnet-b"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "subnet-private-a" {
  vpc_id     = aws_vpc.vpc_default.id
  cidr_block = var.aws_subnet_private_a_cidr

  tags = {
    Name = "subnet-${var.environment}-private-subnet-a"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "subnet-private-b" {
  vpc_id     = aws_vpc.vpc_default.id
  cidr_block = var.aws_subnet_private_b_cidr

  tags = {
    Name = "subnet-${var.environment}-private-subnet-b"
    Environment = "${var.environment}"
  }
}

resource "aws_default_route_table" "rt_default" {
  default_route_table_id = aws_vpc.vpc_default.default_route_table_id

  route {
    cidr_block = var.aws_subnet_public_a_cidr
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  route {
    cidr_block = var.aws_subnet_public_b_cidr
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  route {
    cidr_block = var.aws_subnet_private_a_cidr
  }

  route {
    cidr_block = var.aws_subnet_private_b_cidr
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = {
    Name = "rt-${var.environment}-default"
  }
}