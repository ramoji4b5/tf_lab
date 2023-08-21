provider "google" {
  credentials = file("./acount.json")
  project     = "acquired-sound-175002"
  region      = "us-central1"
  zone        = "us-central1-c"
}

##D:\CODING\Terraform\tf_lab\tf_gcp\acount.json