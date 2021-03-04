# Kubernetes Helm Challenge - Caylent - Ricardocg 

- Task: Using Helmfile create a multi-stage deployment.

## Deploy GKE Cluster 

- Create servicce account to deploy with terraform 
- get credentials.json
- ENV GOOGLE_APPLICATION_CREDENTIALS='/root/.config/gcloud/gpc-key.json'
- cd terraform-gke/ 
- terraform init && terraform plan 
- terraform apply 

# Conect to cluster 
- glcoud auth 
- gcloud set project kubernetes-helm-challenge-jg
- gcloud container clusters get-credentials caylent-cluster --zone us-east1

# Build and Push custom Docker Image with Circle-CI
- Every push to the project builds a new version of the image and push it to my personal dockerHUB (ricardocg94/)
- https://github.com/Ricardocg9412/docker-hello 

# Deploy helm chart with helmfile 
- cd Helmfile/ 
- helmfile -e dev apply  | Deploys dev-chart/ configs
- helmfile -e stage apply  | Deploys stage-chart/ configs 

# Helm secrets 
- file secrets.yaml contains the secrets injected and encrypted with GPG key locally (file consist of GCP credentials) and secret defined on each chart to encrypt project id value 

- kubectl get secret credentials -o yaml
- kubectl exec $POD -- printenv

# Access the service 
- Both envs are deployed with a Load Balancer Services 
- To get the LB endpoint : kubectl get --namespace default svc
- http://$SERVICE_IP:80

# Destroy envs 
- helmfile delete 
- terraform destroy 
