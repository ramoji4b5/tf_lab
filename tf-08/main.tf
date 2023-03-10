module "bucket" {
  source = "./modules/s3"
  bucket = var.bucket
}

module "appServer" {
  source = "./modules/ec2"
  instance_type = var.vm_type
  subnet_id = var.subnet_id
}