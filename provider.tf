terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}

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

resource "digitalocean_container_registry" "oil" {
  name                    = "oil"
  subscription_tier_slug  = "starter"
}
