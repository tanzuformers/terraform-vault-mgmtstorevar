<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_sshcommand"></a> [sshcommand](#requirement\_sshcommand) | 0.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sshcommand"></a> [sshcommand](#provider\_sshcommand) | 0.2.2 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_generic_secret.vault_secret_bootvm](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_generic_secret.vault_secret_mgmt_kube](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_generic_secret.vault_secret_tkg_env](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_generic_secret.vault_secret_vsphere_env](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [sshcommand_command.get_kubectl](https://registry.terraform.io/providers/invidian/sshcommand/0.2.2/docs/data-sources/command) | data source |
| [sshcommand_command.get_rsa](https://registry.terraform.io/providers/invidian/sshcommand/0.2.2/docs/data-sources/command) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_output_path"></a> [output\_path](#input\_output\_path) | Local path folder for input/output files (kubectl) | `string` | `"."` | no |
| <a name="input_tkg_bootvm"></a> [tkg\_bootvm](#input\_tkg\_bootvm) | BootVM params | <pre>object({<br>        image_name = string<br>        name = string<br>        ip = string<br>        password = string<br>        hostname = string<br>    })</pre> | <pre>{<br>  "hostname": "bootstrap",<br>  "image_name": "TKG-Demo-Appliance-1.3.1",<br>  "ip": "192.168.206.10",<br>  "name": "bootvm",<br>  "password": ""<br>}</pre> | no |
| <a name="input_tkg_env"></a> [tkg\_env](#input\_tkg\_env) | vSphere environment elements for Tanzu | <pre>object({<br>        datacenter_name = string<br>        cluster_name = string<br>        resource_pool = string<br>        datastore_name = string<br>        datastore_url = string<br>        vm_folder = string<br>        content_catalog_name = string<br>    })</pre> | <pre>{<br>  "cluster_name": "workload",<br>  "content_catalog_name": "TKG DEMO",<br>  "datacenter_name": "HomeLabWorkload",<br>  "datastore_name": "datastore1",<br>  "datastore_url": "ds:///vmfs/volumes/5b0b0910-295caf38-a57d-ac1f6b1bfc94/",<br>  "resource_pool": "TKG",<br>  "vm_folder": "tkgvms"<br>}</pre> | no |
| <a name="input_tkg_mgmt"></a> [tkg\_mgmt](#input\_tkg\_mgmt) | Management cluster parameters | <pre>object({<br>        ip = string<br>        loadbalancer_cidr = string<br>    })</pre> | <pre>{<br>  "ip": "192.168.206.11",<br>  "loadbalancer_cidr": "192.168.206.60-192.168.206.70"<br>}</pre> | no |
| <a name="input_tkg_network"></a> [tkg\_network](#input\_tkg\_network) | Networking environment for Tanzu | <pre>object({<br>        network_id = string<br>        gateway = string<br>        netmask = string<br>        dns = string<br>        domain = string<br>        vip_address = string<br>        workload_address = string<br>    })</pre> | <pre>{<br>  "dns": "192.168.200.10",<br>  "domain": "local",<br>  "gateway": "192.168.206.1",<br>  "netmask": "24 (255.255.255.0)",<br>  "network_id": "dpgTKG",<br>  "vip_address": "192.168.206.20-192.168.206.30",<br>  "workload_address": "192.168.206.40-192.168.206.50"<br>}</pre> | no |
| <a name="input_vault_ip"></a> [vault\_ip](#input\_vault\_ip) | Vault instance ip | `string` | n/a | yes |
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | Vault instance token | `string` | n/a | yes |
| <a name="input_vsphere_env"></a> [vsphere\_env](#input\_vsphere\_env) | vCenter environment variables | <pre>object({<br>        server = string<br>        user = string<br>        password = string<br>    })</pre> | <pre>{<br>  "password": "VMware1!",<br>  "server": "vcsa.local.lab",<br>  "user": "admin@vsphere.local"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_result"></a> [result](#output\_result) | Operation result |
<!-- END_TF_DOCS -->