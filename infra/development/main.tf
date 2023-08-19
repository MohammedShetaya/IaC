resource "aws_vpc" "dev_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "dev_pulic_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = "10.123.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "dev-subnet"
  }
}

resource "aws_internet_gateway" "dev_internet_gateway" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev_route_table" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev-route-table"
  }
}

resource "aws_route" "dev_route" {
  route_table_id         = aws_route_table.dev_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_internet_gateway.id
}

resource "aws_route_table_association" "dev_route_table_association" {
  subnet_id      = aws_subnet.dev_pulic_subnet.id
  route_table_id = aws_route_table.dev_route_table.id
}

resource "aws_security_group" "dev_security_group" {
  name        = "dev-sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

variable "instance_key" {
  description = "instance public key"
  type        = string
}

resource "aws_key_pair" "instance_key_pair" {
  key_name   = "key_pair"
  public_key = var.instance_key
}


