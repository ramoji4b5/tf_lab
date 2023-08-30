provider "google" {
  credentials = file("./acount.json")
  project     = "dsmltf"
  region      = "us-central1"
  zone        = "us-central1-c"
}

##D:\CODING\Terraform\tf_lab\tf_gcp\acount.json