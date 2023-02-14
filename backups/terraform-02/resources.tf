variable "iam_user_name_prefix" {
  type    = string #any, number, bool, list, map, set, object, tuple
  default = "my_iam_user"
}

resource "aws_iam_user" "new_iam_user" {
  count = 2
  name  = "${var.iam_user_name_prefix}_${count.index}"
}


resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}