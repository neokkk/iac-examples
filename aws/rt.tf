resource "aws_route_table" "nn-vpc-01-rt-public" {
  vpc_id = aws_vpc.nn-vpc-01.id

  tags = {
    Name = "nn-vpc-01-rt-public"
  }
}

resource "aws_route" "nn-vpc-01-rt-public-igw" {
  route_table_id         = aws_route_table.nn-vpc-01-rt-public.id
  gateway_id             = aws_internet_gateway.nn-vpc-01-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "nn-vpc-01-rta-public-01" {
  subnet_id      = aws_subnet.nn-vpc-01-subnet-public-01.id
  route_table_id = aws_route_table.nn-vpc-01-rt-public.id
}

# resource "aws_route_table_association" "nn-vpc-01-rta-public-02" {
#   subnet_id = aws_subnet.nn-vpc-01-subnet-public-02.id
#   route_table_id = aws_route_table.nn-vpc-01-rt-public.id
# }

resource "aws_route_table" "nn-vpc-01-rt-private" {
  vpc_id = aws_vpc.nn-vpc-01.id

  tags = {
    Name = "nn-vpc-01-rt-private"
  }
}

resource "aws_route_table_association" "nn-vpc-01-rta-private-01" {
  subnet_id      = aws_subnet.nn-vpc-01-subnet-private-01.id
  route_table_id = aws_route_table.nn-vpc-01-rt-private.id
}

resource "aws_route_table_association" "nn-vpc-01-rta-private-02" {
  subnet_id      = aws_subnet.nn-vpc-01-subnet-private-01.id
  route_table_id = aws_route_table.nn-vpc-01-rt-private.id
}
