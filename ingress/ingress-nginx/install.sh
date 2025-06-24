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
        --create-namespace \
        -n "$NAMESPACE" \
        -f "$(dirname "$0")/values.yaml" > /dev/null
print_success "ingress-nginx installed successfully"

print_step "Checking ingress-nginx pods status..."
kubectl wait pods -n "$NAMESPACE" -l bakito.github.com/kind-with-registry-action=ingress-nginx --for condition=Ready --timeout=90s
print_success "ingress-nginx pods are running"

print_step "Print Helm Info"
echo "Installation completed. Current helm releases in $NAMESPACE:"
helm list -n "$NAMESPACE"
