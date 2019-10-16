FROM ubuntu:bionic

LABEL maintainer="benjamin@corelight.com"

COPY ./install-nvm.sh /root/install-nvm.sh

RUN apt-get update && \
    apt-get -y install git make gcc curl sudo debhelper && \
    bash /root/install-nvm.sh

RUN curl -L "https://dl.google.com/go/go1.12.linux-amd64.tar.gz" -o /root/go1.12.linux-amd64.tgz && \
    tar -C /usr/local -xzf /root/go1.12.linux-amd64.tgz

ENV PATH="${PATH}:/usr/local/go/bin"

ENV NVM_DIR="/root/.nvm"
RUN . "${NVM_DIR}/nvm.sh" && nvm install v12