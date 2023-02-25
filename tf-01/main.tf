### Variable ##########
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}
variable "bucket" {}
### Provider#########
provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
## resources################
resource "aws_s3_bucket" "b" {
  bucket = var.bucket

  tags = {
    Name        = "tf_bucket_test"
    Environment = "Dev"
  }
}
############output#####################
output "tf-ramoji-out" {
  value = aws_s3_bucket.b.bucket
}
###