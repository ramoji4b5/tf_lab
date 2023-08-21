## resources################
resource "aws_s3_bucket" "b" {
  bucket = var.bucket

  tags = {
    Name        = "tf_bucket_test"
    Environment = "Dev"
  }
   versioning {
    enabled = true
  }
}