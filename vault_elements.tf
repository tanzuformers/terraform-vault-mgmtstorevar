### Finally put critical and config vars in vault
resource "vault_generic_secret" "vault_secret_bootvm" {
  path = "secret/bootvm"
  data_json = <<EOT
{
  "ip": "${var.tkg_bootvm.ip}",
  "user": "root",
  "password":   "${var.tkg_bootvm.password}",
  "rsa": "${chomp(data.sshcommand_command.get_rsa.result)}"
}
EOT
}


resource "vault_generic_secret" "vault_secret_mgmt_kube" {

  path = "secret/mgmt_cluster"
  data_json = <<EOT
{
  "kubeconf":   "${base64encode(data.sshcommand_command.get_kubectl.result)}"
}
EOT
}

resource "vault_generic_secret" "vault_secret_vsphere_env" {
  
  path = "secret/vsphere_env"
  data_json = <<EOT
{
    "server" : "${var.vsphere_env.server}",
    "user" : "${var.vsphere_env.user}",
    "password" : "${var.vsphere_env.password}"
}
EOT
}

resource "vault_generic_secret" "vault_secret_tkg_env" {
  
  path = "secret/tkg_env"
  data_json = <<EOT
{
  "datacenter" : "${var.tkg_env.datacenter_name}",
  "resource_pool": "${var.tkg_env.resource_pool}",
  "datastore": "${var.tkg_env.datastore_name}",
  "datastore_url": "${var.tkg_env.datastore_url}",
  "vm_folder": "${var.tkg_env.vm_folder}",
  "network": "${var.tkg_network.network_id}",
  "cluster": "${var.tkg_env.cluster_name}"
}
EOT
}
