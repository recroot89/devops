provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "recroot" {
  name     = "${var.project_name}"
  image    = "docker-18-04"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.recroot.fingerprint}"]
}

resource "digitalocean_ssh_key" "recroot" {
  name       = "recroot"
  public_key = "${file("../files/recroot.pub")}"
}
