#!/bin/bash

set -e

. "$(dirname "$0")/../utils.sh"

INGRESS_NGINX_VERSION="${1}"
NAMESPACE="ingress-nginx"

print_step "Adding ingress-nginx Helm repository..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
print_success "ingress-nginx Helm repository added"

print_step "Installing ingress-nginx with Helm..."
helm install "ingress-nginx" "ingress-nginx/ingress-nginx" \
        --version "$INGRESS_NGINX_VERSION" \
        --atomic \
        --timeout=600s \
        --create-namespace \
        -n "$NAMESPACE" \
        -f "$(dirname "$0")/values.yaml" > /dev/null
print_success "ingress-nginx installed successfully"

print_step "Print Helm Info"
echo "Installation completed. Current helm releases in $NAMESPACE:"
helm list -n "$NAMESPACE"
