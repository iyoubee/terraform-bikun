// firewall.tf

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
