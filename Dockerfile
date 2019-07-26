FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bind9 && \
    mkdir /run/named && \
    chown -R bind: /run/named

VOLUME ["/etc/bind/", "/var/cache/bind", "/run/named/"]

EXPOSE 53/udp

CMD ["named", "-g", "-u", "bind", "-c", "/etc/bind/named.conf"] 
