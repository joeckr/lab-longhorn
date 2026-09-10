#!/bin/bash
set -e

kubectl create namespace longhorn-system || true
kubectl label namespace longhorn-system pod-security.kubernetes.io/enforce=privileged --overwrite

# Make sure we use the local chart
helm upgrade --install longhorn ./charts/longhorn --namespace longhorn-system
