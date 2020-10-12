FROM debian:stretch
LABEL maintainer="SelaCoin Developers <dev@selacoin.org>"
LABEL description="Dockerised SelaCoinCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
