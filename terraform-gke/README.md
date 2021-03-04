# GKE Cluster - ricardocg

- This module deploys a GCP hosted Kubernetes cluster using GKE service

# Inputs 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | The location (region or zone) in GCP to host the cluster in| String | us-east1 | no |
| description | A brief description of the purpose for the cluster| String | "GKE CLUSTER" | no |
| name | The name of the cluster | String | - |:yes:|
| network | A reference (self link) to the VPC network to host the cluster in | String | default | no |
| subnetwork | A reference (self link) to the subnetwork to host the cluster in | String | "" |no|
| sa_name | Name for the service account to be created for the cluster | String | - |yes|
| sa_description | Brief description for the service account to be created for the cluster | String | - |yes|
| project | GCP Project ID | String | - |yes|

# Outputs 

| Name | Description |
|------|-------------|
| name | The name of the cluster master. |
| endpoint | The IP address of the cluster master. |
| client_certificate | Public certificate used by clients to authenticate to the cluster endpoint. |
| client_key | Private key used by clients to authenticate to the cluster endpoint. |
| cluster_ca_certificate | The public certificate that is the root of trust for the cluster. |

# Usage
```js

module "gke_cluster"{
    source          = "../"
    name            = "test-cluster"
    sa_name         = "service_account_test"
    sa_description  = "service account for GKE Cluster"
    project         = "YOUR PROJECT NAME"
}

```

  
