resource "digitalocean_domain" "default" {
   name = "oilmud.io"
   ip_address = digitalocean_droplet.server.ip_address
}

resource "digitalocean_record" "CNAME-www" {
  domain = digitalocean_domain.default.name
  type = "CNAME"
  name = "www"
  value = "@"
}
