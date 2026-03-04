# kind-with-registry-action

GitHub action that creates a kind cluster with integrated container registry.

## Usage

```yaml
- name: Install Kind
  uses: bakito/kind-with-registry-action@main
  with:
    kind_version:       v0.31.0                // (optional) kind version to be used
    kind_cluster_name:  chart-testing          // (optional) The name of kind cluster
    kubectl_version:    v1.35.2                // (optional) kubectl version to be used
    node_image:         kindest/node:v1.35.1   // (optional) The k8s node image to be used
    debug:              false                  // (optional) enable debug output for helm chart installation
    docker_image_name:  ""                     // (optional) Name of the docker image to import to kind
    docker_image_file:  ""                     // (optional) Name of the docker image file (tar) to import to kind
```

## Inputs

- **kind_version**: The version of kind to use (default: `v0.31.0`)
- **kind_cluster_name**: The name of the kind cluster (default: `chart-testing`)
- **kubectl_version**: The version of kubectl to use (default: `v1.35.2`)
- **node_image**: The k8s node image to use (default: `kindest/node:v1.35.1`)
- **debug**: Enable debug output for helm chart installation (default: `false`)
- **docker_image_name**: Name of the docker image to import to kind (optional)
- **docker_image_file**: Name of the docker image file (tar) to import to kind (optional)

## Docker Image Import

You can optionally import a Docker image into the kind cluster:

```yaml
- name: Install Kind with Docker Image
  uses: bakito/kind-with-registry-action@main
  with:
    docker_image_name: my-app:latest
    docker_image_file: my-app.tar  # optional, loads image from tar file first
```
