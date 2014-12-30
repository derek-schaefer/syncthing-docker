FROM debian:wheezy
ADD dist/syncthing /usr/local/sbin/
RUN ln -s /root/Sync /sync && \
    ln -s /root/.config/syncthing /config
VOLUME ["/sync", "/config"]
EXPOSE 8080 22000 21025/udp
CMD ["syncthing", "-gui-address", "0.0.0.0:8080"]
