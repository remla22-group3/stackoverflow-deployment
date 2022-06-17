#!/bin/sh

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add kvaps https://kvaps.github.io/charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install promstack prometheus-community/kube-prometheus-stack
helm install nfs-server kvaps/nfs-server-provisioner --set persistence.enabled=true
helm install mongo bitnami/mongodb
kubectl apply -f k8s-config.yml
