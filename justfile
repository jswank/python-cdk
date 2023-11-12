set dotenv-load

tag := "latest:
image := "jswank/python-cdk"

registry := "ghcr.io"
registry_user := "jswank"

# this environment variable will be passed to podman login as the password
registry_pass_var := "REGISTRY_PASSWORD"  

# build a new image
build flags="":
  podman build -t {{image}}:{{tag}} {{flags}} -f Dockerfile ctx

# publish the image
publish alt_tag=tag: 
  @ podman tag {{image}}:{{tag}} {{registry}}/{{image}}:{{alt_tag}}
  @ echo "${{ registry_pass_var }}" | podman login {{registry}} -u {{registry_user}} --password-stdin
  @ podman push {{registry}}/{{image}}:{{alt_tag}}
  @ podman logout {{registry}}
