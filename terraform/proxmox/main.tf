
resource "proxmox_vm_qemu" "masters" {
  target_node = local.setting.node
  name = "kubernetes-master"
  vmid = 0

  clone = local.setting.clone
  full_clone = false

  onboot = true

#   disk {
#     type = "virtio"
#     storage = "storage01"
#     size    = "30G"
#   }     

  cores = 2
  memory = 2048

  network {
    model = "virtio"
    bridge = local.setting.network[0].bridge
    firewall = false
    link_down = false
  }

  ipconfig0 = "ip=${local.setting.network[0].ip},gw=${local.setting.network[0].gateway}"
  ciuser = local.setting.user
  sshkeys =  <<EOF
    ${ local.setting.ssh_public }
  EOF
}



resource "proxmox_vm_qemu" "worker" {
  # ==== general ====
  count = length(local.setting.network) - 1

  target_node = local.setting.node
  name = "kubernetes-worker-${count.index}"
  vmid = 0
  
  
  clone = local.setting.clone
  full_clone = false

#   disk {
#     type = "virtio"
#     storage = "storage01"
#     size    = "10G"
#   }        

  cores = 2
  memory = 2048

  network {  
    model = "virtio"
    bridge = local.setting.network[count.index + 1].bridge
    firewall = false
    link_down = false
  }

  onboot = true

  ipconfig0 = "ip=${local.setting.network[count.index + 1].ip},gw=${local.setting.network[count.index + 1].gateway}"
  ciuser = local.setting.user
  sshkeys =  <<EOF
    ${ local.setting.ssh_public }
  EOF
}