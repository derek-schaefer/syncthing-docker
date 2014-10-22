FROM ubuntu:14.04

MAINTAINER Derek Schaefer <derek.schaefer@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    apt-get autoremove -y && \
    apt-get clean

ENV VERSION 0.10.2
ENV DISTRIBUTION syncthing-linux-amd64-v$VERSION

RUN wget -O $VERSION.tar.gz https://github.com/syncthing/syncthing/releases/download/v$VERSION/$DISTRIBUTION.tar.gz && \
    tar xzf $VERSION.tar.gz && \
    mv $DISTRIBUTION/syncthing /usr/local/bin/ && \
    rm -r $VERSION.tar.gz $DISTRIBUTION

VOLUME ["/root/.config/syncthing", "/root/Sync"]

EXPOSE 8080 22000 21025/udp

CMD ["syncthing", "-gui-address", "0.0.0.0:8080"]
