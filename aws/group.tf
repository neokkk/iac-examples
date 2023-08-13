resource "aws_iam_group" "admin" {
  name = "admin"
}

resource "aws_iam_group_policy" "admin" {
  name   = "admin"
  group  = aws_iam_group.admin.name
  policy = data.aws_iam_policy.admin.policy
}

resource "aws_iam_group" "lb" {
  name = "lb"
  path = "/system/"
}

resource "aws_iam_group_policy" "lb_ro" {
  name   = "lb_ro"
  group  = aws_iam_group.lb.name
  policy = data.aws_iam_policy.lb_ro.policy
}
