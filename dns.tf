resource "digitalocean_domain" "default" {
  name       = "petrichormud.com"
  ip_address = digitalocean_droplet.server.ipv4_address
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.default.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}

resource "digitalocean_record" "play" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "play"
  value  = digitalocean_droplet.server.ipv4_address
}

resource "digitalocean_record" "mxone" {
  ttl      = 10800
  domain   = digitalocean_domain.default.id
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "spool.mail.gandi.net."
}

resource "digitalocean_record" "mxtwo" {
  ttl      = 10800
  domain   = digitalocean_domain.default.id
  type     = "MX"
  name     = "@"
  priority = 50
  value    = "fb.mail.gandi.net."
}

resource "digitalocean_record" "txt" {
  ttl    = 10800
  domain = digitalocean_domain.default.id
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:_mailcust.gandi.net ?all"
}
