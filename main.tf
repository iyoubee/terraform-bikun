// main.tf

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

module "instances" {
  source = "./instance"
}

module "network" {
  source = "./network"
}

module "firewall" {
  source = "./firewall"
}