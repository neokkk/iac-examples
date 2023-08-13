resource "aws_security_group" "nn-sg-public" {
  name        = "nn-sg-public"
  description = "nn-sg-public"
  vpc_id      = aws_vpc.nn-vpc-01.id

  tags = {
    Name = "nn-sg-public"
  }
}

resource "aws_vpc_security_group_ingress_rule" "nn-sg-public-ingress-ssh" {
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  security_group_id = aws_security_group.nn-sg-public.id
}

resource "aws_vpc_security_group_ingress_rule" "nn-sg-public-ingress-icmp" {
  from_port         = "-1"
  to_port           = "-1"
  ip_protocol       = "icmp"
  cidr_ipv4         = "0.0.0.0/0"
  security_group_id = aws_security_group.nn-sg-public.id
}

resource "aws_vpc_security_group_egress_rule" "nn-sg-public-egress-all" {
  from_port         = "-1"
  to_port           = "-1"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  security_group_id = aws_security_group.nn-sg-public.id
}

resource "aws_security_group" "nn-sg-private" {
  name        = "nn-sg-private"
  description = "nn-sg-private"
  vpc_id      = aws_vpc.nn-vpc-01.id

  tags = {
    Name = "nn-sg-private"
  }
}

resource "aws_vpc_security_group_ingress_rule" "nn-sg-private-ingress-from-public" {
  from_port         = "-1"
  to_port           = "-1"
  ip_protocol       = "-1"
  cidr_ipv4         = aws_vpc.nn-vpc-01.cidr_block
  security_group_id = aws_security_group.nn-sg-private.id
}

resource "aws_vpc_security_group_egress_rule" "nn-sg-private-egress-all" {
  from_port         = "-1"
  to_port           = "-1"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  security_group_id = aws_security_group.nn-sg-private.id
}
