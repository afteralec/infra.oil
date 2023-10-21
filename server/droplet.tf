resource "digitalocean_droplet" "server" {
  image = "ubuntu-22-04-x64"
  name = "server"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }

  provisioner "file" {
    source = "conf/nginx/nginx.conf"
    destination = "/etc/nginx"
  }

  provisioner "file" {
    source = "conf/ufw/"
    destination = "/etc/ufw"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo ufw enable && y",
    ]
  }
}
