module "bucket" {
  source = "./modules/s3"
  bucket = var.bucket
}