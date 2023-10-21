resource "digitalocean_droplet" "server" {
  image       = "ubuntu-22-04-x64"
  name        = "server"
  region      = "nyc3"
  size        = "s-1vcpu-1gb"
  monitoring  = true
  ssh_keys    = [
    data.digitalocean_ssh_key.terraform.id
  ]
  user_data   = file("user-data.sh")

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }

  provisioner "file" {
    source      = "conf/nginx/nginx.conf"
    destination = "/root/nginx.conf"
  }
}
