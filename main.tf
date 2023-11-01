terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "corrupt_system_files_and_filesystem_on_windows_machine" {
  source    = "./modules/corrupt_system_files_and_filesystem_on_windows_machine"

  providers = {
    shoreline = shoreline
  }
}