#!/bin/bash

TAG=0.4.6

if [ -d postgres_exporter ]; then
  git -C postgres_exporter fetch 
else
  git clone https://github.com/wrouesnel/postgres_exporter
fi

git -C postgres_exporter checkout v${TAG} -- .
patch -d postgres_exporter -p1 < arm.patch

if [ ! -f postgres_exporter/bin/postgres_exporter_v${TAG}_linux-arm/postgres_exporter ]; then
  cd postgres_exporter
  docker run --rm -v $PWD:/go/src/github.com/wrouesnel/postgres_exporter -w /go/src/github.com/wrouesnel/postgres_exporter -it arm32v7/golang go run mage.go binary
  cd -
fi

cp postgres_exporter/bin/postgres_exporter_v${TAG}_linux-arm/postgres_exporter docker/postgres_exporter

cd docker

docker build -t jouve/postgres_exporter:arm32v7-${TAG} -t jouve/postgres_exporter:arm32v7 --build-arg binary=postgres_exporter .

