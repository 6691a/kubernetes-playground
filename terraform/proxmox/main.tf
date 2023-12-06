
resource "proxmox_vm_qemu" "masters" {
  # ==== general ====
  target_node = local.setting.node
  name = "kubernetes-master"
  vmid = 0

  ssh_private_key =  <<EOF
    ${ local.setting.ssh_public }
  EOF
 
  # ==== template ====
  iso = local.setting.os_template
  full_clone = false

  # ==== disk  ====
  disk {
    type = "scsi"
    storage = "storage01"
    size    = "5G"
  }

  cores = 2
  memory = 2048

  # ==== network ====
  network {
    model = "virtio"
    bridge = local.setting.network[0].bridge
  }

#   os_type = "cloud-init"
#   ipconfig0 = "${local.setting.network[0].ip},${local.setting.network[0].gateway}"
#   ciuser = "ubuntu"
 

  # ==== system ====
  onboot = false
}



# resource "proxmox_lxc" "worker" {
#   # ==== general ====
#   count = length(local.setting.network) - 1
#   target_node = local.setting.node
#   hostname = "kubernetes-worker-${count.index}"
#   vmid = 0
#   unprivileged = true
#   ssh_public_keys =  <<EOF
#     ${ local.setting.ssh_public }
#   EOF
 
#   # ==== template ====
#   ostemplate = local.setting.os_template


#   # ==== disk  ====
#   rootfs {
#     storage = "storage01"
#     size    = "5G"
#   }
#   swap = 0

#   cores = 1
#   memory = 1024

#   # ==== network ====]
#   network {
#     name   = local.setting.network[count.index + 1].name
#     bridge = local.setting.network[count.index + 1].bridge
#     ip     = local.setting.network[count.index + 1].ip
#     gw     = local.setting.network[count.index + 1].gateway
#   }

#   # ==== system ====
#   onboot = false
#   start = true
# }