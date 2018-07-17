#!/bin/bash

TAG=1.21.2

cd docker

docker build -t jouve/compose:arm32v7-${TAG} -t jouve/compose:arm32v7 --build-arg TAG=${TAG} .
