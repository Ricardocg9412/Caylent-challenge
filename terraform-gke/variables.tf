variable "location" {
  description = "The location (region or zone) in GCP to host the cluster in"
  type        = string
  default     = "us-east1"
}

variable "description" {
  description = "Brief description of the purpose for the cluster"
  type        = string
  default     = "GKE CLUSTER"
}

variable "name" {
  description = "The name of the cluster"
  type        = string
  default     = "caylent-cluster"
}

variable "network" {
  description = "A reference (self link) to the VPC network to host the cluster in"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "A reference (self link) to the subnetwork to host the cluster in"
  type        = string
  default     = ""
}

variable "sa_name" {
  description = "A name for the service account to be created"
  type        = string
  default = "testsa"
}

variable "sa_description" {
  description = "A brief description for the service account"
  type        = string
  default = "test"
}

variable "project" {
  description = "GCP Project ID "
  type        = string
  default = "kubernetes-helm-challenge-jg"
}