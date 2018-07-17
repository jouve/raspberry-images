#!/bin/bash

TAG=2.3.2

if [ ! -f prometheus-${TAG}.linux-armv7.tar.gz ]; then
  curl -L -O https://github.com/prometheus/prometheus/releases/download/v${TAG}/prometheus-${TAG}.linux-armv7.tar.gz
fi

cd docker

tar xf ../prometheus-${TAG}.linux-armv7.tar.gz
cp -r prometheus-${TAG}.linux-armv7/* .
rm -r prometheus-${TAG}.linux-armv7
docker build -t jouve/prometheus:arm32v7-${TAG} -t jouve/prometheus:arm32v7 .

