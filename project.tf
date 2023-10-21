resource "digitalocean_project" "oil" {
  name        = "Oil"
  description = "Oil MUD"
  purpose     = "Web Application"
  environment = "Production"
  resources   = [
    digitalocean_droplet.server.urn,
    digitalocean_domain.default.urn
  ]
}
