resource "hcloud_server" "devserver" {
  name        = "devserver"
  image       = "debian-12"
  server_type = "cpx31"
  location    = "nbg1"
  user_data   = data.cloudinit_config.cloudinit.rendered
  ssh_keys    = ["flofeld@flofeld-nixos"] #TODO change to own key name
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

data "cloudinit_config" "cloudinit" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    filename     = "cloud-init.yaml"
    content = templatefile("${path.module}/cloud-init.yml", {})
  }
}
