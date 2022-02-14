terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.10.0"
    }
  }
}

provider "google" {
  # Configuration options
}

resource "google_service_account" "default" {
  account_id   = "b770b1f2f5fc25f0e220f335dc656d685a597c3e"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["First_VM"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
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
    }
  }

#   metadata = {
#     sshKey = “debian:${file(var.ssh_public_key_filepath)}”
#   }
}
