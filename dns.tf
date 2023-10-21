resource "digitalocean_domain" "default" {
   name = "oilmud.io"
   ip_address = digitalocean_droplet.server.ipv4_address
}

resource "digitalocean_record" "cname" {
  domain = digitalocean_domain.default.name
  type = "CNAME"
  name = "www"
  value = "@"
}
