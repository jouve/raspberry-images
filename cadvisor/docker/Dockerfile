FROM arm32v7/debian:stretch-slim

COPY cadvisor /usr/bin/cadvisor
 
EXPOSE 8080
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
