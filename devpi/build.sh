#!/bin/bash

DEVPI_SERVER_TAG=4.5.0
DEVPI_WEB_TAG=3.3.0
TAG=${DEVPI_SERVER_TAG}-${DEVPI_WEB_TAG}

cd docker

docker build -t jouve/devpi:arm32v7-${TAG} -t jouve/devpi:arm32v7 --build-arg DEVPI_SERVER_TAG=${DEVPI_SERVER_TAG} --build-arg DEVPI_WEB_TAG=${DEVPI_WEB_TAG} .
