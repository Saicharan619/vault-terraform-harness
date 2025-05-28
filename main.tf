variable "vault_address" {}
variable "vault_token" {}

variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

data "vault_generic_secret" "gcp_creds" {
  path = "secret/data/gcpcreds"  # Your Vault secret path here
}

provider "google" {
  credentials = base64decode(data.vault_generic_secret.gcp_creds.data["servicekey_base64"])
  project     = data.vault_generic_secret.gcp_creds.data["project_id"]
  region      = var.region
  zone        = var.zone
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
