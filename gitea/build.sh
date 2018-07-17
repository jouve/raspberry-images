#!/bin/bash

TAG=1.4.3

#if [ -d gitea ]; then
#  git -C gitea fetch 
#else
#  git clone https://github.com/go-gitea/gitea
#fi

#git -C gitea checkout v${TAG}

#cp -R gitea/docker docker

if [ ! -f docker/gitea ]; then
  curl -L -o docker/gitea https://github.com/go-gitea/gitea/releases/download/v${TAG}/gitea-${TAG}-linux-arm-7
  chmod 755 docker/gitea
fi

cd docker

docker build -t jouve/gitea:arm32v7-${TAG} -t jouve/gitea:arm32v7 .

