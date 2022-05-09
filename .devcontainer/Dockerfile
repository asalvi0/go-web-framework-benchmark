# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.14, 3.13, 3.12, 3.11
ARG VARIANT="3.15"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

RUN wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
RUN sudo tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
RUN rm go1.18.1.linux-amd64.tar.gz

ENV PATH="PATH=$PATH:/usr/local/go/bin"

RUN apk --no-cache add bash libressl wrk gnuplot ttf-dejavu ttf-droid ttf-freefont ttf-liberation gcompat file patchelf
