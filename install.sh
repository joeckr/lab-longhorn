#!/bin/bash
set -e

kubectl create namespace longhorn-system || true
kubectl label namespace longhorn-system pod-security.kubernetes.io/enforce=privileged --overwrite

# Build dependencies for the wrapper chart
helm dependency update ./charts/longhorn

# Install the wrapper chart
helm upgrade --install longhorn ./charts/longhorn --namespace longhorn-system
