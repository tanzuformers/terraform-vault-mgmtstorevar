variable "output_path"{
    description = "Local path folder for input/output files (kubectl)"
    type = string
    default = "."
}
variable "vault_ip"{
    description = "Vault instance ip"
    type = string
}
variable "vault_token"{
    description = "Vault instance token"
    type = string
}
variable "vsphere_env" {
    description = "vCenter environment variables"
    type = object({
        server = string
        user = string
        password = string
    })
    default = {
        server = "vcsa.local.lab"
        user = "admin@vsphere.local"
        password = "VMware1!"
    }
}

## Suggested a dedicated env for tkg clusters
variable "tkg_env" {
    description = "vSphere environment elements for Tanzu"
    type = object({
        datacenter_name = string
        cluster_name = string
        resource_pool = string
        datastore_name = string
        datastore_url = string
        vm_folder = string
        content_catalog_name = string
    })
    default = {
        datacenter_name = "HomeLabWorkload"
        cluster_name = "workload"
        resource_pool = "TKG"
        datastore_name = "datastore1"
        datastore_url = "ds:///vmfs/volumes/5b0b0910-295caf38-a57d-ac1f6b1bfc94/"
        vm_folder  = "tkgvms"
        content_catalog_name = "TKG DEMO"
    }
}

variable "tkg_network" {
    description = "Networking environment for Tanzu"
    type = object({
        network_id = string
        gateway = string
        netmask = string
        dns = string
        domain = string
        vip_address = string
        workload_address = string
    })
    default = {
        network_id = "dpgTKG"
        gateway = "192.168.206.1"
        netmask = "24 (255.255.255.0)"
        dns = "192.168.200.10"
        domain = "local"
        vip_address = "192.168.206.20-192.168.206.30"
        workload_address = "192.168.206.40-192.168.206.50"
    }
}

variable tkg_bootvm {
    description = "BootVM params"
    type = object({
        image_name = string
        name = string
        ip = string
        password = string
        hostname = string
    })
    default = {
        image_name = "TKG-Demo-Appliance-1.3.1"
        name = "bootvm"
        ip = "192.168.206.10"
        hostname = "bootstrap"
        password = ""
    }
}

variable "tkg_mgmt" {
    description = "Management cluster parameters"
    type = object({
        ip = string
        loadbalancer_cidr = string
    })
    default = {
        ip = "192.168.206.11"
        loadbalancer_cidr = "192.168.206.60-192.168.206.70"
    }
}
