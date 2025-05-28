terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = base64decode(var.gcp_creds)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

data "vault_generic_secret" "gcp_creds" {
  path = "secret/data/gcp-service-account"
}

resource "google_compute_instance" "vm_instance" {
  name         = "harness-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = "echo Hello, Harness VM > /var/log/startup-script.log"
}
