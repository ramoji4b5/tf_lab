module "bucket" {
  source = "./modules/s3"
  bucket = var.bucket
}

module "appServer" {
  source = "./modules/ec2"
  instance_type = var.vm_type
  availability_zone = var.availability_zone
}