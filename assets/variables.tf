variable "gcloud_project" {
    description = "GCP project ID"
    type = string
    default = "smart-girl-travel-production"
}

variable "gcloud_region" {
    type = string
    default = "us-central1"
}

variable "gcloud_zone" {
    type = string
    default = "us-central1-a"
}
