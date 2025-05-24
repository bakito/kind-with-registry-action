#!/bin/bash
echo "🧹 Cleaning up..."
kind delete cluster --name kong-demo
rm -rf charts/
rm -f kong-values.yaml
echo "✅ Cleanup complete"
