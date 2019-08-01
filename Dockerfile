FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bind9 && \
    mkdir /run/named && \
    chown -R bind: /run/named

COPY ["rndc.key", "/etc/bind/"]
COPY ["named.conf.options", "/etc/bind/"]
RUN chown bind: /etc/bind/rndc.key && \
    chown root:bind /etc/bind/named.conf*

COPY run /usr/local/bin/
RUN chmod +x /usr/local/bin/run 

VOLUME ["/etc/bind/", "/var/cache/bind/", "/run/named/"]

EXPOSE 53/udp

ENTRYPOINT ["/usr/local/bin/run"]
