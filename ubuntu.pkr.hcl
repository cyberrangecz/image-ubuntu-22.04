packer {
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
  }
}

variable "boot_wait" {
  type    = string
  default = "10s"
}

variable "cpus" {
  type    = number
  default = 4
}

variable "disk_size" {
  type    = number
  default = 4096
}

variable "headless" {
  type    = string
  default = "true"
}

variable "memory_size" {
  type    = number
  default = 4096
}

variable "shutdown_command" {
  type    = string
  default = "shutdown -P now"
}

variable "ssh_password" {
  type    = string
  default = "ubuntu"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "ssh_wait_timeout" {
  type    = string
  default = "10m"
}

variable "vm_name" {
  type    = string
  default = "ubuntu-22.04"
}

variable "vnc_vrdp_bind_address" {
  type    = string
  default = "127.0.0.1"
}

variable "vnc_vrdp_port" {
  type    = number
  default = 5900
}

source "qemu" "qemu" {
  boot_wait           = var.boot_wait
  disk_image          = true
  disk_interface      = "virtio-scsi"
  disk_size           = var.disk_size
  cd_files            = ["http/user-data", "http/meta-data"]
  cd_label            = "cidata"
  headless            = var.headless
  iso_checksum        = "file:https://cloud-images.ubuntu.com/jammy/current/SHA256SUMS"
  iso_url             = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  net_device          = "virtio-net"
  output_directory    = "target-qemu"
  qemuargs            = [["-m", "${var.memory_size}m"], ["-smp", "cpus=${var.cpus},maxcpus=16,cores=4"]]
  shutdown_command    = var.shutdown_command
  ssh_password        = var.ssh_password
  ssh_port            = var.ssh_port
  ssh_username        = var.ssh_username
  ssh_wait_timeout    = var.ssh_wait_timeout
  use_default_display = "true"
  vm_name             = var.vm_name
  vnc_bind_address    = var.vnc_vrdp_bind_address
  vnc_port_max        = var.vnc_vrdp_port
  vnc_port_min        = var.vnc_vrdp_port
}

source "vagrant" "vbox" {
  add_force    = true
  checksum     = "file:https://cloud-images.ubuntu.com/jammy/current/SHA256SUMS"
  communicator = "ssh"
  output_dir   = "target-vbox"
  provider     = "virtualbox"
  source_path  = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-vagrant.box"
}

build {
  sources = [
    "source.qemu.qemu",
    "source.vagrant.vbox"
  ]

  provisioner "file" {
    destination = "/tmp/cloud.cfg"
    only        = ["qemu.qemu"]
    source      = "cloud.cfg"
  }

  provisioner "shell" {
    scripts = ["scripts/packages.sh"]
  }

  provisioner "shell" {
    only    = ["vagrant.vbox"]
    scripts = ["scripts/packagesQEMU.sh"]
  }

  provisioner "shell" {
    only    = ["vagrant.vbox"]
    scripts = ["scripts/packagesVBox.sh"]
  }

  provisioner "shell" {
    scripts = ["scripts/fixes.sh"]
  }

}
