### From bootvm

data "sshcommand_command" "get_rsa" {
    host = var.tkg_bootvm.ip
    user = "root"
    password = var.tkg_bootvm.password
    command = "cat /root/.ssh/id_rsa.pub"
}

### Kubectl
data "sshcommand_command" "get_kubectl" {
    host = var.tkg_bootvm.ip
    user = "root"
    password = var.tkg_bootvm.password
    command = "cat /root/tkglab/mgmt-kubeconfig"
}