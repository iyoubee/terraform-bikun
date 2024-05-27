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
  source = "./instance.tf"
}

module "network" {
  source = "./network.tf"
}

module "firewall" {
  source = "./firewall.tf"
}