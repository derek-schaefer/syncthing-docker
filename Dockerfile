FROM debian:wheezy

ENV SYNCTHING_VERSION 0.11.0
RUN apt-get update && \
    apt-get install -y curl && \
    curl -OL https://github.com/syncthing/syncthing/releases/download/v$SYNCTHING_VERSION/syncthing-linux-amd64-v$SYNCTHING_VERSION.tar.gz && \
    tar -xzf syncthing-linux-amd64-v$SYNCTHING_VERSION.tar.gz && \
    cp syncthing-linux-amd64-v$SYNCTHING_VERSION/syncthing /usr/local/bin && \
    rm -r syncthing-linux-amd64-v$SYNCTHING_VERSION* && \
    apt-get clean

RUN ln -s /root/Sync /sync && \
    ln -s /root/.config/syncthing /config

VOLUME /sync /config
EXPOSE 8080 22000 21025/udp

CMD ["syncthing", "-gui-address", "0.0.0.0:8080"]
