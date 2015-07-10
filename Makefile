IMAGE=derekschaefer/syncthing
TAG=$(shell git describe --abbrev=0 --tags | sed -e 's/^v//g')

all: build

build:
	docker build -t $(IMAGE) .
	docker tag -f $(IMAGE) $(IMAGE):$(TAG)

push:
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(TAG)

run:
	docker run -it --rm --name syncthing \
	  -p 8080:8080 -p 22000:22000 -p 21025:21025/udp \
	  -v `pwd`/config:/mnt/config -v `pwd`/sync:/mnt/sync \
	  $(IMAGE) $(CMD)
