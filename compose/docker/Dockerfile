FROM arm32v7/python:3.7.0-slim-stretch

ARG TAG
RUN pip install --no-cache-dir docker-compose==${TAG}

ENTRYPOINT ["/usr/local/bin/docker-compose"]
