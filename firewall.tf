resource "digitalocean_firewall" "server_firewall" {
  name = "ssh-http-https-mud-tcp"

  # droplet_ids = [digitalocean_droplet.server.id]
  droplet_ids = []

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol          = "tcp"
    port_range        = "8020"
    source_addresses  = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol          = "tcp"
    port_range        = "8030"
    source_addresses  = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol    = "tcp"
    port_range  = "1-65535"
  }

  outbound_rule {
    protocol    = "udp"
    port_range  = "1-65535"
  }

  outbound_rule {
    protocol = "icmp"
  }
}
