# kind-with-registry-action

Github action that creates a kind cluster with integrated container registry.

Optionally ingress can be enabled.

```yaml
- name: Install Kind
  uses: bakito/kind-with-registry-action@main
  with:
    kind_version:    v0.20.0                // (optional) kind version to be used
    kubectl_version: v1.27.3                // (optional) kubectl version to be used
    ingress_enabled: true                   // (optional) enable ingress-nginx
    registry_image:  'registry:2'           // (optional) The registry docker image to be used
    node_image:      'kindest/node:v1.27.3' // (optional) The k8s node imaage to be used
```

## Outputs

- ingress_class_name: The name of the ingress class
- registry: The address of the docker registry
