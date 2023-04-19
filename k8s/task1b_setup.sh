# Place your commands here
# Create Kubernetes Cluster
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml;

# Verify Cluster
docker ps

#Build Docker image
docker build -t siyingpng:myimage ./app/.;

# Load Docker image into Cluster
kind load docker-image siyingpng:myimage --name kind-1

# Create Deployment
kubectl apply -f k8s/manifests/backend-deployment.yaml;

# Verify Deployment
kubectl get deployments
kubectl get pods --show-labels

# Create Ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

# Verify Ingress controller
kubectl -n ingress-nginx get deploy -w

# Create Service
kubectl apply -f k8s/manifests/backend-service.yaml;

# Verify Service
kubectl get svc

# Create Ingress
kubectl apply -f k8s/manifests/backend-ingress.yaml;

# Verify Ingress
kubectl get ingress

# Access localhost
kubectl exec backend-7b69b696bd-5rc56 -- curl http://localhost:3000










