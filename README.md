# cdkdev

A minimal image for using the Python AWS CDK

## Quickstart

```console
$ docker run -ti --rm ghcr.io/jswank/python-cdk
```

## Automation

A [just](https://github.com/casey/just) taskfile is included as [bin/cdkdev](bin/cdkdev). 

```console
$ cdkdev help

Available recipes:
    clean              # Remove the persistent container
    default            # Invoke the 'persist' recipe
    help recipe="help" # Display this listing. Detailed help is available with 'help recipe_name'.
    persist aport=""   # Run (or attach to) a persistent container.
    restart            # Remove a running container, and run the default recipe
    run                # Run an ephemeral container.
    save image=image   # Save the running container as a new image


# Usage: run
#
# Start a shell in an ephemeral container, mounting the current directory as
# the project
#
# Run an ephemeral container.
@run:
```
