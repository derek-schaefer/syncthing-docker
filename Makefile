NAME=syncthing
ORG=derekschaefer
IMAGE=$(ORG)/$(NAME)
PWD=$(shell pwd)
TAG=$(shell git describe --abbrev=0 --tags | sed -e 's/^v//g')

all: build

build:
	docker build -t $(IMAGE) .
	docker tag -f $(IMAGE) $(IMAGE):$(TAG)

push:
	docker push $(IMAGE)

run:
	docker run -it --rm \
	  -p 8080:8080 -p 22000:22000 -p 21025:21025/udp \
	  -v $(PWD)/config:/config -v $(PWD)/sync:/sync \
	  $(IMAGE) $(CMD)
