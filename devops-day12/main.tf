terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

resource "local_file" "devops_log" {
  filename = "${path.module}/day12_check.txt"
  content  = "Updated via IaC."
}