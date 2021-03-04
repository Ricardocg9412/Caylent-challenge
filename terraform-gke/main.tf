# ----------------------------------------------------------------
# CREATE A CUSTOM SERVICE ACCOUNT TO USE WITH THE GKE CLUSTER
# ----------------------------------------------------------------
resource "google_service_account" "service_account" {
  account_id   = var.sa_name
  display_name = var.sa_description
  project = var.project
}

# -----------------------
# CREATE CLUSTER
# -----------------------
resource "google_container_cluster" "cluster" {
  #Main variables 
  project     = var.project
  name        = var.name
  location    = var.location
  description = var.description
  network     = var.network
  subnetwork  = var.subnetwork

  #Remove defualt node pool 
  remove_default_node_pool = true
  initial_node_count       = 1
}

# -----------------------
# CREATE A NODE POOL
# -----------------------
resource "google_container_node_pool" "node_pool" {
  project     = var.project
  name     = "main-pool"
  location = var.location
  cluster  = google_container_cluster.cluster.name

  initial_node_count = "1"
  
  # Scaling options
  autoscaling {
    min_node_count = "1"
    max_node_count = "5"
  }

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  node_config {
    # Using Preemtible for testing purpose 
    preemptible  = true
    machine_type = "e2-medium"

    labels = {
      all-pools-example = "true"
    }

    # Default SA (Testing purpose)
    service_account = google_service_account.service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}