resource "google_dns_managed_zone" "smartgirltravel" {
    name        = "smartgirltravel"
    dns_name    = "smartgirltravel.com."
    description = "smartgirltravel.com"
}

resource "google_dns_record_set" "smartgirltravel_www_prod_1_a" {
    managed_zone = google_dns_managed_zone.smartgirltravel.name
    name = "www-prod-1.smartgirltravel.com."
    type = "A"
    rrdatas = [google_compute_address.www_prod_1.address]
    ttl = 300
}

resource "google_dns_record_set" "smartgirltravel_a" {
    managed_zone = google_dns_managed_zone.smartgirltravel.name
    name = "smartgirltravel.com."
    type = "A"
    rrdatas = [google_compute_address.www_prod_1.address]
    ttl = 300
}

resource "google_dns_record_set" "smartgirltravel_www_a" {
    managed_zone = google_dns_managed_zone.smartgirltravel.name
    name = "www.smartgirltravel.com."
    type = "A"
    rrdatas = [google_compute_address.www_prod_1.address]
    ttl = 300
}

resource "google_dns_record_set" "smartgirltravel_prometheus_a" {
    managed_zone = google_dns_managed_zone.smartgirltravel.name
    name = "prometheus.smartgirltravel.com."
    type = "A"
    rrdatas = [google_compute_address.www_prod_1.address]
    ttl = 300
}
