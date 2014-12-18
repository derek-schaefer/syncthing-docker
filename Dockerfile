FROM debian:wheezy
MAINTAINER Derek Schaefer <derek.schaefer@gmail.com>
ADD build/syncthing /
EXPOSE 8080 22000 21025/udp
VOLUME ["/root/.config/syncthing", "/root/Sync"]
CMD ["/syncthing", "-gui-address", "0.0.0.0:8080"]
