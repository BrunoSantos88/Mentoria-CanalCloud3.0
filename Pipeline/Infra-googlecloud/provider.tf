terraform {
  required_version = "1.3.7"
}

provider "google" {
  project = "devops-399217"
  region  = "us-central1"
  zone    = "us-central1-c"
}