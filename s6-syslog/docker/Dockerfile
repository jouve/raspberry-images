FROM arm32v6/alpine:3.8

RUN apk add --no-cache s6-networking

EXPOSE 514/udp

CMD [ "execlineb", "-c", "s6-tcpserver4-socketbinder -b 0 -m 0.0.0.0 514 fdblock 0 ucspilogd" ]
