resource "aws_vpc" "nn-vpc-01" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_internet_gateway" "nn-vpc-01-igw" {
  vpc_id = aws_vpc.nn-vpc-01.id

  tags = {
    Name = "nn-vpc-01-igw"
  }
}

resource "aws_subnet" "nn-vpc-01-subnet-public-01" {
  vpc_id                  = aws_vpc.nn-vpc-01.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "nn-vpc-01-subnet-public-01"
  }
}

# resource "aws_subnet" "nn-vpc-01-subnet-public-02" {
#   vpc_id = aws_vpc.nn-vpc-01.id
#   cidr_block = "172.16.11.0/24"
#   availability_zone = "${var.region}c"

#   tags = {
#     Name = "nn-vpc-01-subnet-public-02"
#   }
# }

resource "aws_eip" "nn-vpc-01-ngw-eip" {
  domain = "vpc"

  tags = {
    Name = "nn-vpc-01-ngw-eip"
  }
}

resource "aws_nat_gateway" "nn-vpc-01-ngw" {
  allocation_id = aws_eip.nn-vpc-01-ngw-eip.id
  subnet_id     = aws_subnet.nn-vpc-01-subnet-public-01.id # important!

  tags = {
    Name = "nn-vpc-01-ngw"
  }

  depends_on = [aws_internet_gateway.nn-vpc-01-igw] # for proper ordering
}

resource "aws_subnet" "nn-vpc-01-subnet-private-01" {
  vpc_id            = aws_vpc.nn-vpc-01.id
  cidr_block        = "172.16.12.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "nn-vpc-01-subnet-private-01"
  }
}

resource "aws_subnet" "nn-vpc-01-subnet-private-02" {
  vpc_id            = aws_vpc.nn-vpc-01.id
  cidr_block        = "172.16.13.0/24"
  availability_zone = "${var.region}c"

  tags = {
    Name = "nn-vpc-01-subnet-private-02"
  }
}
