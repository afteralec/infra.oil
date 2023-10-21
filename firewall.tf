resource "digitalocean_firewall" "server_firewall" {
  name = "Server Firewall"

  droplet_ids = [digitalocean_droplet.server.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
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
    protocol = "tcp"
  }

  outbound_rule {
    protocol = "udp"
  }

  outbound_rule {
    protocol = "icmp"
  }
}
