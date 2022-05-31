FROM ubuntu:18.04

USER root

# basic
RUN apt update && apt upgrade -y
RUN apt install -y vim ufw curl git libffi-dev libssl-dev python3-dev python3 python3-pip apt-transport-https ca-certificates curl gnupg2 software-properties-common build-essential libcurl4-openssl-dev libxkbfile-dev

# enable NodeSource
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

# install node
RUN apt install -y nodejs 

# make app home dir
RUN mkdir /usr/src/app

COPY package.json /usr/src/app/package.json
RUN cd /usr/src/app
RUN npm init -y 
RUN npm install
RUN rm -r /usr/src/app
