output "instance_names" {
  description = "Names of the created instances"
  value       = [
    google_compute_instance.bikun-main.name,
    google_compute_instance.bikun-osrm.name
  ]
}

output "external_ip" {
  description = "Reserved external IP address"
  value       = google_compute_address.bikun-main-ip.address
}