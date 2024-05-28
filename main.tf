terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_firewall" "http_https" {
  name    = "allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["http-server", "https-server"]
  target_tags = ["http-server", "https-server"]
}

resource "google_compute_address" "bikun-main-ip" {
  name   = "bikun-main-ip"
  region = var.region
}


resource "google_compute_instance" "bikun-main" {
  name         = "bikun-main"
  machine_type = var.instance_type
  zone         = var.zone
  tags         = ["https-server"]

  depends_on = [google_compute_address.bikun-main-ip]

  boot_disk {
    initialize_params {
      size = var.main_disk_size_gb
      image = var.os
    }
  }

  network_interface {
    network = "default"
    access_config {
        nat_ip = google_compute_address.bikun-main-ip.address
    }
  }
}

resource "google_compute_instance" "bikun-osrm" {
  name         = "bikun-osrm"
  machine_type = var.instance_type
  zone         = var.zone
  tags         = ["https-server"]

  boot_disk {
    initialize_params {
      size = var.osrm_disk_size_gb
      image = var.os
    }
  }

  network_interface {
    network = "default"
  }
}