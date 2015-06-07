FROM debian

RUN apt-get update && apt-get install -y curl ca-certificates

ENV SYNCTHING_VERSION 0.11.8
RUN DIST=syncthing-linux-amd64-v$SYNCTHING_VERSION && \
    mkdir /tmp/syncthing && cd /tmp/syncthing && \
    curl -OL https://github.com/syncthing/syncthing/releases/download/v$SYNCTHING_VERSION/$DIST.tar.gz && \
    tar -xzf $DIST.tar.gz && cp $DIST/syncthing /usr/local/bin

RUN apt-get autoremove --purge -y curl && apt-get clean

RUN useradd -m syncthing
RUN ln -s /syncthing/Sync /mnt/sync && \
    ln -s /syncthing/.config/syncthing /mnt/config

VOLUME /mnt/sync /mnt/config
EXPOSE 8080 22000 21025/udp

USER syncthing
WORKDIR /home/syncthing
ENTRYPOINT ["syncthing"]
CMD ["-gui-address", "0.0.0.0:8080"]
