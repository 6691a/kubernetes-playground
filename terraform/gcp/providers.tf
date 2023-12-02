provider "google" {
  credentials = local.credentials
  project     = local.project
  region      = var.region
}