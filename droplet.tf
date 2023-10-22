resource "digitalocean_droplet" "server" {
  image       = "ubuntu-22-04-x64"
  name        = "server"
  region      = "nyc3"
  size        = "s-1vcpu-1gb"
  ipv6        = true
  monitoring  = true
  ssh_keys    = [
    data.digitalocean_ssh_key.terraform.id
  ]
  user_data   = file("server.yaml")
}
