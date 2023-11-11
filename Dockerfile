FROM ghcr.io/jswank/alpine-cli:edge

USER root

RUN apk add -U --no-cache stow curl git just \
  neovim py3-pynvim \
  py3-pip py3-virtualenv \
  aws-cli aws-cli-doc mandoc \
  npm

RUN python3 -m venv /usr/local/python-cdk \
    && . /usr/local/python-cdk/bin/activate \
    && pip install aws-cdk-lib

RUN npm install -g aws-cdk
# install the javascript / typescript sdk globally
# RUN sudo npm install -g typescript aws-cdk-lib

COPY home/.bash_profile /home/cli/.bash_profile

RUN chown -R cli:cli /home/cli

USER cli
