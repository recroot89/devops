provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "devops" {
  name   = "${var.project_name}"
  image  = "ubuntu-18-04-x64"
  region = "fra1"
  size   = "s-1vcpu-1gb"
}
