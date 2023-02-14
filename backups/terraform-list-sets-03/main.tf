#variable "iam_user_name_prefix" {
# type    = string #any, number, bool, list, map, set, object, tuple
#default = "my_iam_user"
#}

variable "printMapNames" {
  default = ["Piyush", "Nikhil", "Ramit"]
}

resource "aws_iam_user" "Terraform_list_set_03" {
  #count = length(var.printMapNames)
  #name  = var.printMapNames[count.index]
  # now we will change the list to set for seeting  up the "index_key": 0, to "index_key": piyush,
  for_each = toset(var.printMapNames)
  name     = each.value

}
