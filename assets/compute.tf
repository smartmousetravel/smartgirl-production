resource "google_compute_firewall" "http" {
    name = "allow-http"
    network = "default"
    allow {
        protocol = "tcp"
        ports = ["80", "443"]
    }
    target_tags = ["web"]
}

resource "google_compute_disk" "www_wp_content" {
    name = "www-wp-content"
    zone = var.gcloud_zone
    size = 10  // GB
}

resource "google_compute_disk" "www_wp_db" {
    name = "www-wp-db"
    zone = var.gcloud_zone
    size = 10  // GB
}

resource "google_compute_address" "www_prod_1" {
    name = "www-prod-1"
    region = var.gcloud_region
}

resource "google_compute_instance" "www_prod_1" {
    name = "www-prod-1"
    zone = var.gcloud_zone
    machine_type = "e2-micro"
    tags = ["web"]

    boot_disk {
        initialize_params {
            size = 10  // GB
            image = "ubuntu-2004-lts"
        }
    }

    attached_disk {
        source = google_compute_disk.www_wp_content.self_link
        device_name = google_compute_disk.www_wp_content.name
    }

    attached_disk {
        source = google_compute_disk.www_wp_db.self_link
        device_name = google_compute_disk.www_wp_db.name
    }

    network_interface {
        network = "default"
        access_config {
            nat_ip = google_compute_address.www_prod_1.address
        }
    }
}
