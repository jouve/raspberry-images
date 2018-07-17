#!/bin/bash

TAG=0.30.2

if [ -d cadvisor ]; then
  git -C cadvisor fetch 
else
  git clone https://github.com/google/cadvisor
fi

git -C cadvisor checkout v${TAG}

if [ ! -f cadvisor/cadvisor ]; then
  cd cadvisor
  docker run --rm -v $PWD:/go/src/github.com/google/cadvisor -w /go/src/github.com/google/cadvisor -it arm32v7/golang make build
  cd -
fi

cp cadvisor/cadvisor docker/cadvisor

cd docker

docker build -t jouve/cadvisor:arm32v7-${TAG} -t jouve/cadvisor:arm32v7 .

