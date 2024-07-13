terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.47.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.4"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "hcloud" {
  token = #TODO add api token
}
