set dotenv-load

tag := `grep ^FROM Dockerfile | cut -d: -f2`
image := "jswank/python-cdk"

registry := "ghcr.io"
registry_user := "jswank"

# this environment variable will be passed to podman login
pass_var := "REGISTRY_PASSWORD"  

# build
default: build

# this help
help:
  just -l

# build a new image
build:
  podman build -t {{image}} -f Dockerfile ctx

# publish the image to the default registry
publish: _publish

# publish the image to ghcr.io
publish-ghcr: (_publish "ghcr.io")

# publish the image to quay.io
publish-quay: (_publish "quay.io")

# publish the image to docker.io
publish-docker: (_publish "docker.io")

_publish registry=registry user=registry_user alt_tag=tag:
  @ echo "${{ pass_var }}" | podman login {{registry}} -u {{user}} --password-stdin 
  @ podman tag {{image}}:{{tag}} {{registry}}/{{image}}:{{alt_tag}}
  @ podman push {{registry}}/{{image}}:{{alt_tag}}
  @ podman logout {{registry}}
