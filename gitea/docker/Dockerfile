FROM arm32v7/debian:stretch-slim
LABEL maintainer="The Gitea Authors"

EXPOSE 22 3000

RUN apt update && \
    apt install -y \
    busybox \
    ca-certificates \
    sqlite \
    git \
    libpam-modules \
    runit \
    curl \
    openssh-server \
    gettext \
    tzdata
RUN addgroup \
    --system --gid 1000 \
    git && \
  adduser \
    --system --no-create-home --disabled-password \
    --home /data/git \
    --shell /bin/bash \
    --uid 1000 \
    --gid 1000 \
    git && \
  echo "git:$(dd if=/dev/urandom bs=24 count=1 status=none | base64)" | chpasswd

ENV USER git
ENV GITEA_CUSTOM /data/gitea
ENV GODEBUG=netdns=go

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/runsvdir", "/etc/s6"]

COPY docker /
COPY gitea /app/gitea/gitea

