
terraform {
  required_providers {
      sshcommand = {
         source  = "invidian/sshcommand"
         version = "0.2.2"
      }
   }
}
provider "vault" {
   address = "http://${var.vault_ip}:8200" #Get the value from svc
   token = var.vault_token
}
