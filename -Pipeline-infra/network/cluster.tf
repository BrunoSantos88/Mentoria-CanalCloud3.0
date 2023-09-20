resource "google_container_cluster" "cluster-k8" {
  name                     = "mycluster-dev1"
  location                 = "us-central1"
  node_locations           = ["us-central1-a"]
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpccluster.id
  subnetwork               = google_compute_subnetwork.subnet.id

  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
    
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes-dev-test" {
  name       = "my-node-pool-dev-test1"
  location   = "southamerica-east1"
  cluster    = google_container_cluster.cluster-k8.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  }

management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 1
  }


}