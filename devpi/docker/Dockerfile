FROM arm32v7/python:3.7.0-slim-stretch

ARG DEVPI_SERVER_TAG
ARG DEVPI_WEB_TAG
RUN apt update && \
    apt install -y libffi6 gcc libffi-dev && \
    pip install --no-cache-dir devpi-server==$DEVPI_SERVER_TAG devpi-web==$DEVPI_WEB_TAG && \
    apt purge -y gcc libffi-dev && \
    apt clean

EXPOSE 3141

VOLUME /var/lib/devpi

COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD [ "/docker-entrypoint.sh" ]

