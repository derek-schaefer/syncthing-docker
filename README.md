# syncthing-docker

syncthing: <https://github.com/syncthing/syncthing>

docker hub: <https://registry.hub.docker.com/u/derekschaefer/syncthing/>

## ports

* `8080/tcp`: web interface
* `22000/tcp`: sync protocol
* `21025/udp`: discovery protocol

## volumes

* `/mnt/config`: config files
* `/mnt/sync`: sync tree
