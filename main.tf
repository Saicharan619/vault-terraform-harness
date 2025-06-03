provider "google" {
  project     = "saicharan-457910"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("gcp.json")
}

resource "google_compute_instance" "vm_instance" {
  name         = "vault-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  tags = ["web"]
}
