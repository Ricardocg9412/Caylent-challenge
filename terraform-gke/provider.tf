provider "google" {
  version = "~> 3.16.0"
  region  = var.location
}

provider "random" {
  version = "~> 2.2.1"
}

provider "null" {
  version = "~> 2.1.2"
}

