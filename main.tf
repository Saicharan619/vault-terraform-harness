terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  credentials = var.gcp_creds # No base64decode unless encoded
  project     = var.project_id
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

resource "google_compute_instance" "vm_instance" {
  name         = "harness-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = "default"
    access_config {}
  }
}
