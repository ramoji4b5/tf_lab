### Provider#########
provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

}
##############(Optinal Backend)################
terraform {
  backend "s3" {
    bucket = "lax-tf"
    key    = "dev/ramoji.tfstate"
    region = "us-east-1"
  }
}
