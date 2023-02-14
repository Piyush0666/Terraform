variable "Users" {
  default = {
    Piyush : { Country : "India", Department : "Mechanical" },
    Nikhil : { Country : "Dubai", Department : "Business_Management" }
    Ramit : { Country : "US", Department : "Computer_Science" }
  }
}

resource "aws_iam_user" "Terraform_Map_03" {
  for_each = var.Users
  name     = each.key
  tags = {
    Country : each.value.Country
    Department : each.value.Department
  }
}