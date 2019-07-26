FROM debian:buster

# ENV BIND9_VERSION 
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bind9

VOLUME ["/etc/bind/", "/var/cache/bind"]

CMD ["bash"] 
