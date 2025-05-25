#!/bin/bash

set -e

. "$(dirname "$0")/../utils.sh"

NAMESPACE="test"

print_step "List all Pods in cluster"
kubectl get pods -A

print_step "Installing Test Application with Helm..."
helm install test "$(dirname "$0")" -n "$NAMESPACE" --create-namespace --timeout=600s --atomic --wait --set ingressClassName="${1}"
print_success "Test Application installed successfully"

print_step "curl localhost/echo"
sleep 5
curl localhost/echo