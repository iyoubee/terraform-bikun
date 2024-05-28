// variables.tf

variable "project_id" {
  description = "Define Project ID"
  default     = "<YOUR PROJECT ID>"
}

variable "region" {
  description = "Region to deploy resources"
  default     = "asia-southeast1"
}

variable "zone" {
  description = "Zone within the region"
  default     = "asia-southeast1-a"
}

variable "instance_type" {
  description = "Machine type for instances"
  default     = "e2-medium"
}

variable "main_disk_size_gb" {
  description = "Size of the disk in GB"
  default     = 30
}

variable "osrm_disk_size_gb" {
  description = "Size of the disk in GB"
  default     = 40
}

variable "os" {
  description = "OS Type"
  default     = "debian-cloud/debian-12"
}