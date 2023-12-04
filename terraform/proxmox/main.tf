
resource "proxmox_lxc" "masters" {
  # ==== general ====
  target_node = local.credentials.node
  hostname = "kubernetes-master"
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
    name   = local.credentials.network[0].name
    bridge = local.credentials.network[0].bridge
    ip     = local.credentials.network[0].ip
    gw     = local.credentials.network[0].gateway
  }

  # ==== system ====
  onboot = false
  start = true
}



resource "proxmox_lxc" "worker" {
  # ==== general ====
  count = length(local.credentials.network) - 1
  target_node = local.credentials.node
  hostname = "kubernetes-worker-${count.index}"
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
    name   = local.credentials.network[count.index + 1].name
    bridge = local.credentials.network[count.index + 1].bridge
    ip     = local.credentials.network[count.index + 1].ip
    gw     = local.credentials.network[count.index + 1].gateway
  }

  # ==== system ====
  onboot = false
  start = true
}