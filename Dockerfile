FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bind9

VOLUME ["/etc/bind/", "/var/cache/bind"]

CMD ["bash"]
