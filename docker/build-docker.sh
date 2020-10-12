#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-selacoinpay/selacoind-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/selacoind docker/bin/
cp $BUILD_DIR/src/selacoin-cli docker/bin/
cp $BUILD_DIR/src/selacoin-tx docker/bin/
strip docker/bin/selacoind
strip docker/bin/selacoin-cli
strip docker/bin/selacoin-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
