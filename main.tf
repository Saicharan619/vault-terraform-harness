data "vault_generic_secret" "gcp_creds" {
  path = "secret/gcpcred"
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
