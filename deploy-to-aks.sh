#!/bin/bash

# Variables
AKS_CLUSTER_NAME="<aks-cluster-name>"
RESOURCE_GROUP="<resource-group-name>"
ACR_NAME="<acr-name>"
IMAGE_TAG="$(Build.BuildId)"

# Get AKS credentials
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER_NAME

# Deploy to AKS
kubectl apply -f k8s/deployment.yaml

# Example k8s/deployment.yaml snippet
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: my-app
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: my-app
#   template:
#     metadata:
#       labels:
#         app: my-app
#     spec:
#       containers:
#       - name: my-app
#         image: $ACR_NAME.azurecr.io/<your-acr-repository>:${IMAGE_TAG}
#         ports:
#         - containerPort: 80
