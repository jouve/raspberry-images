#!/bin/bash

# https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.1_armhf.deb 
TAG=5.2.1

if [ -d grafana-docker ]; then
  git -C grafana-docker pull
else
  git clone https://github.com/grafana/grafana-docker.git
fi

cp grafana-docker/run.sh docker/

cd docker

docker build -t jouve/grafana:arm32v7-${TAG} -t jouve/grafana:arm32v7 --build-arg TAG=${TAG} .

