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

resource "digitalocean_record" "mxresend" {
  domain   = digitalocean_domain.default.id
  type     = "MX"
  name     = "send"
  priority = 10
  value    = "feedback-smtp.us-east-1.amazonses.com."
}

resource "digitalocean_record" "txtresendone" {
  domain = digitalocean_domain.default.id
  type   = "TXT"
  name   = "send"
  value  = "v=spf1 include:amazonses.com ~all"
}

resource "digitalocean_record" "txtresendtwo" {
  domain = digitalocean_domain.default.id
  type   = "TXT"
  name   = "resend._domainkey"
  value  = "p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDOED1sd+B0oJg0MOuc4bTzlae4jOflXO0IBFu2MEdDY6gYhnDOtrnZvPquUvLdEW5ydid2qwavYjgI3qzqh4ZeDWCtbQmt22xTuJe+VFjGEftdtbm6rFXBHVTx86Dll4X+CLYS/qvHnh4NGokED0W8mmjyD7fqIn5ZZlpDeMyQ9QIDAQAB"
}
