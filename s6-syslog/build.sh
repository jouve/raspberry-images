#!/bin/bash

TAG=1.0

cd docker

docker build -t jouve/s6-syslog:arm32v6-${TAG} -t jouve/s6-syslog:arm32v6 .
