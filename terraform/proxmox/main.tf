
resource "proxmox_lxc" "primary" {
  # ==== general ====
  target_node = local.credentials.node
  hostname = "kubernetes-primary"
  vmid = 0
  unprivileged = true
  ssh_public_keys =  <<EOF
    ${ local.credentials.ssh }
  EOF
 
  # ==== template ====
  ostemplate = "local:vztmpl/ubuntu-22.10-standard_22.10-1_amd64.tar.zst"


  # ==== disk  ====
  rootfs {
    storage = "storage01"
    size    = "5G"
  }

  # ==== network ====]
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.88.50/24"
    gw     = "192.168.88.1"
    }

  # ==== system ====
  onboot = false
  start = true
}



resource "proxmox_lxc" "nodes" {
  # ==== general ====
  count = 2
  target_node = local.credentials.node
  hostname = "kubernetes-node-${count.index}"
  vmid = 0
  unprivileged = true
  ssh_public_keys =  <<EOF
    ${ local.credentials.ssh }
  EOF
 
  # ==== template ====
  ostemplate = "local:vztmpl/ubuntu-22.10-standard_22.10-1_amd64.tar.zst"


  # ==== disk  ====
  rootfs {
    storage = "storage01"
    size    = "5G"
  }

  # ==== network ====]
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.88.5${count.index + 1}/24"
    gw     = "192.168.88.1"
    }

  # ==== system ====
  onboot = false
  start = true
}