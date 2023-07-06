# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block  # Replace with your desired VPC CIDR block

  tags = {
    Name = "MyVPC"
  }
}

# Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_block  # Replace with your desired public subnet CIDR block
  availability_zone       = var.availability_zone_public  # Replace with your desired availability zone

  tags = {
    Name = "PublicSubnet"
  }
}

# Create private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_1_cidr_block  # Replace with your desired private subnet CIDR block
  availability_zone       = var.availability_zone_private_1  # Replace with your desired availability zone

  tags = {
    Name = "PrivateSubnet1"
  }
}

# Create private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_2_cidr_block  # Replace with your desired private subnet CIDR block
  availability_zone       = var.availability_zone_private_2  # Replace with your desired availability zone

  tags = {
    Name = "PrivateSubnet2"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Create public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "PublicRouteTable"
  }
}

# Create private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "PrivateRouteTable"
  }
}

# Create route in public route table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Create NAT gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "MyNATGateway"
  }
}

# Create EIP for NAT gateway
resource "aws_eip" "my_eip" {
  vpc      = true  # Use domain attribute instead of deprecated "vpc" argument

  tags = {
    Name = "MyEIP"
  }
}

# Create association of private subnets with NAT gateway
resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}
