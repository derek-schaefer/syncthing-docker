NAME=syncthing
ORG=derekschaefer
IMAGE=$(ORG)/$(NAME)

all: build

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

run:
	docker run -it --rm \
	  -p 8080:8080 -p 22000:22000 -p 21025:21025/udp \
	  -v `pwd`/config:/config -v `pwd`/sync:/sync \
	  $(IMAGE) $(CMD)
