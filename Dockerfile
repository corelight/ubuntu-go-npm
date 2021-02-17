FROM ubuntu:bionic

LABEL maintainer="benjamin@corelight.com"

COPY ./nvm/install.sh /root/install-nvm.sh

RUN apt-get update && \
    apt-get -y install git make gcc curl sudo debhelper python && \
    bash /root/install-nvm.sh && \
    rm /root/install-nvm.sh

RUN curl -L "https://golang.org/dl/go1.16.linux-amd64.tar.gz" -o /root/golang.tgz && \
    tar -C /usr/local -xzf /root/golang.tgz

ENV PATH="${PATH}:/usr/local/go/bin"

ENV NVM_DIR="/root/.nvm"
RUN . "${NVM_DIR}/nvm.sh" && nvm install v12.15.0
