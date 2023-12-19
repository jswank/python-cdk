FROM ghcr.io/jswank/alpine-cli:3

LABEL org.opencontainers.image.description A CLI environment for AWS CLI & CDK

USER root

RUN apk add -U --no-cache stow curl git \
  just go-task \
  neovim py3-pynvim \
  py3-pip py3-virtualenv \
  aws-cli aws-cli-doc mandoc \
  nodejs npm

RUN python3 -m venv /usr/local/python-cdk \
    && . /usr/local/python-cdk/bin/activate \
    && pip install aws-cdk-lib

RUN npm install -g aws-cdk
# install the javascript / typescript sdk globally
# RUN sudo npm install -g typescript aws-cdk-lib

COPY home/.bash_profile /home/cli/.bash_profile

RUN chown -R cli:cli /home/cli

USER cli
