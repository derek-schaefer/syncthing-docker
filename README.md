# Syncthing Docker

Run Syncthing with the convenience of Docker.

## Usage

```bash
docker pull derekschaefer/syncthing
foreman start
```

## Configuration

Edit `.env` to your liking:

```bash
GUI_PORT=8080
PROTOCOL_PORT=22000
DISCOVERY_PORT=21025

CONFIG_VOLUME=/home/user/syncthing/config
SYNC_VOLUME=/home/user/syncthing/sync
```
