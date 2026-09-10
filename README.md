# lab-longhorn
Source of truth for me using longhorn in homelab environments

## Talos Linux Prerequisites

Before installing Longhorn on a Talos Linux cluster, you must ensure that your Talos cluster meets Longhorn's prerequisites (such as system extensions for iSCSI and pod security policies).

Please refer to the official [Talos Support Documentation for Longhorn](https://longhorn.io/docs/1.7.2/advanced-resources/os-distro-specific/talos-linux-support/) for detailed setup instructions.

## Installation Instructions

1. Install Longhorn

Once the Talos Linux prerequisites are met, you can install Longhorn using the provided local wrapper Helm chart. This wrapper chart declares the official Longhorn chart as a dependency.

**Option A: Run the installation script**

```bash
./install.sh
```

**Option B: Manually install via Helm**

```bash
kubectl create namespace longhorn-system || true
kubectl label namespace longhorn-system pod-security.kubernetes.io/enforce=privileged --overwrite
helm dependency update ./chart
helm upgrade --install longhorn ./chart --namespace longhorn-system
```
