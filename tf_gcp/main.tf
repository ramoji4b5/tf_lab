resource "google_storage_bucket" "auto-expire" {
  name          = var.gcp_tf_bucket
  location      = var.gcp_tf_bucket_location
  force_destroy = true

  ##public_access_prevention = "enforced"
}

resource "google_compute_address" "my_ip" {
  name = "my-ip"

}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
      nat_ip = google_compute_address.my_ip.address
    }
  }

  metadata = {
    foo = "bar"
  }


  ##metadata_startup_script = "echo hi > /test.txt"

}

