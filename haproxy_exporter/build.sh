#!/bin/bash

TAG=0.9.0

if [ ! -f haproxy_exporter-${TAG}.linux-armv7.tar.gz ]; then
  curl -L -O https://github.com/prometheus/haproxy_exporter/releases/download/v${TAG}/haproxy_exporter-${TAG}.linux-armv7.tar.gz
fi

cd docker

tar xf ../haproxy_exporter-${TAG}.linux-armv7.tar.gz
mv haproxy_exporter-0.9.0.linux-armv7/haproxy_exporter .
docker build -t jouve/haproxy_exporter:arm32v7-${TAG} -t jouve/haproxy_exporter:arm32v7 .

