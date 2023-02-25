### Variable ##########
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}
variable "bucket" {}
variable "no_of_bucket" {
  
}
### Provider#########
provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

}
## resources################
resource "aws_s3_bucket" "b" {
    count = var.no_of_bucket
    bucket = "${var.bucket}-${count.index}"

  tags = {
    Name        = "tf_bucket_test"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count = var.no_of_bucket
  bucket = aws_s3_bucket.b[count.index].bucket
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  count = var.no_of_bucket
  bucket = aws_s3_bucket.b[count.index].bucket

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {
      and {
        prefix = "log/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  rule {
    id = "tmp"

    filter {
      prefix = "tmp/"
    }

    expiration {
      date = "2023-01-13T00:00:00Z"
    }

    status = "Enabled"
  }
}
############output#####################
output "tf-ramoji-out" {
  value = aws_s3_bucket.b[*].bucket
}
###