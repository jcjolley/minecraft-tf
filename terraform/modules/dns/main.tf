locals {
  short_name = trimsuffix(var.domain, ".")
  friendly_name = replace(local.short_name, ".", "-")
}

resource "google_dns_managed_zone" "default" {
  name     = local.friendly_name
  dns_name = var.domain
  labels = {
    billing_group = var.billing_group
  }
}

resource "google_dns_record_set" "root_a" {
  name = var.domain
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.default.name

  rrdatas = [var.ip]
}

resource "google_dns_record_set" "subdomain_a" {
  name = "${var.suffix}.${google_dns_managed_zone.default.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.default.name

  rrdatas = [var.ip]
}

data "google_dns_record_set" "soa" {
  name = var.domain
  type = "SOA"
  // ttl          = 21600
  managed_zone = google_dns_managed_zone.default.name
  /* rrdatas      = ["ns-cloud-e1.googledomains.com. cloud-dns-hostmaster.google.com. 1 21600 3600 259200 300"] */
}

data "google_dns_record_set" "ns" {
  name = var.domain
  type = "NS"
  // ttl          = 21600
  managed_zone = google_dns_managed_zone.default.name

  /* rrdatas = [
    "ns-cloud-e1.googledomains.com.",
    "ns-cloud-e2.googledomains.com.",
    "ns-cloud-e3.googledomains.com.",
    "ns-cloud-e4.googledomains.com."
  ]*/

}

output "domain" {
  value = "${var.suffix}.${local.short_name}"
}
