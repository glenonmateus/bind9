FROM debian:buster
LABEL maintainer="Glenon Mateus <glenonmateus@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bind9 && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /run/named && \
    chown -R bind: /run/named

COPY ["rndc.key", "/etc/bind/"]
COPY ["named.conf.options", "/etc/bind/"]
COPY ["options", "."]
RUN chown bind: /etc/bind/rndc.key && \
    chown root:bind /etc/bind/named.conf*

VOLUME ["/etc/bind/", "/var/cache/bind/", "/run/named/"]

EXPOSE 53/udp

COPY docker-entrypoint .
RUN chmod +x docker-entrypoint
ENTRYPOINT ["/docker-entrypoint"]
