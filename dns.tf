resource "digitalocean_domain" "default" {
   name = "petrichormud.com"
   ip_address = digitalocean_droplet.server.ipv4_address
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.name
  type = "CNAME"
  name = "www"
  value = "@"
}

resource "digitalocean_record" "play" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "play"
  value  = digitalocean_droplet.server.ipv4_address
}
