#!/bin/bash

set -e

. "$(dirname "$0")/../utils.sh"

KONG_VERSION="${1}"
NAMESPACE="kong"

print_step "Installing Gateway API CRDs..."
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
print_success "Gateway API CRDs installed"

print_step "Adding Kong Helm repository..."
helm repo add kong https://charts.konghq.com
helm repo update
print_success "Kong Helm repository added"

print_step "Installing Kong with Helm..."
helm install kong kong/kong -n "$NAMESPACE" --version "${KONG_VERSION}" \
  --create-namespace -f "$(dirname "$0")/values.yaml" \
  --wait --timeout=600s --atomic
print_success "Kong installed successfully"

print_step "Print Helm Info"
echo "Installation completed. Current helm releases in $NAMESPACE:"
helm list -n "$NAMESPACE"