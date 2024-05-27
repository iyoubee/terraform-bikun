// network.tf

resource "google_compute_address" "bikun-main-ip" {
  name   = "bikun-main-ip"
  region = var.region
}

