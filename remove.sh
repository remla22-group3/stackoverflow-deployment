#!/bin/sh

kubectl delete -f k8s-config.yml
helm uninstall mongo
helm uninstall nfs-server
helm uninstall promstack
