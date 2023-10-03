resource "google_compute_network" "vpccluster" {
  name = "cluster-vpc1"
  auto_create_subnetworks = false
}  

resource "google_compute_subnetwork" "subnet" {
  name          = "sunetwork2"
  ip_cidr_range = "172.10.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpccluster.id
}

resource "google_compute_firewall" "cluster-firewall" {
  project = "devops-399217"
  name    = "firwallcluster1"
  network = google_compute_network.vpccluster.id
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443","30000-32900","3306"]
  }

  source_tags   = ["cluster-k8-dev"]
  source_ranges = ["0.0.0.0/0"]

}