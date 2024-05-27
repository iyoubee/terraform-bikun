// instance.tf

resource "google_compute_instance" "bikun-main" {
  name         = "bikun-main"
  machine_type = var.instance_type
  zone         = var.zone
  tags         = ["http-server"]

  depends_on = [google_compute_address.bikun-main-ip]

  boot_disk {
    initialize_params {
      size = var.disk_size_gb
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
      size = var.disk_size_gb
      image = var.os
    }
  }

  network_interface {
    network = "default"
  }
}
