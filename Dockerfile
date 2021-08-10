FROM ubuntu:focal

LABEL maintainer="aws@corelight.com"

COPY ./nvm/install.sh /root/install-nvm.sh

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get -y install git make gcc curl sudo debhelper python && \
    bash /root/install-nvm.sh && \
    rm /root/install-nvm.sh

# use the latest stable Go version
RUN set -eux; \
    curl -L "https://dl.google.com/go/$(curl -Ls 'https://golang.org/VERSION?m=text').linux-amd64.tar.gz" \
    -o /root/golang.tgz && \
    tar -C /usr/local -xzf /root/golang.tgz && \
    rm /root/golang.tgz

ENV PATH="${PATH}:/usr/local/go/bin"

ENV NVM_DIR="/root/.nvm"
RUN . "${NVM_DIR}/nvm.sh" && nvm install v12.15.0
