resource "google_container_cluster" "master" {
  name = "kubernetes-gke"
  location = "${var.region}-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network    = "default"
  subnetwork = "default"
  deletion_protection = false
}


resource "google_container_node_pool" "worker" {
  name       = "kubernetes-worker"
  location   = "${var.region}-a"
  cluster    = google_container_cluster.master.name
  node_count = 3
  node_config {
    machine_type = "e2-small"
    disk_type    = "pd-standard"
  }
}
