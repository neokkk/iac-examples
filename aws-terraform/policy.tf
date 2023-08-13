data "aws_iam_policy" "admin" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy" "lb_ro" {
  arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingReadOnly"
}