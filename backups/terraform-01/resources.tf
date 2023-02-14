# plan - execute 
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "pankaj-verma-00000066"
    versioning {
        enabled = true
    }
}
resource "aws_iam_user" "my_iam_user" {
  name="iamuser_pankaj_verma_001"

}