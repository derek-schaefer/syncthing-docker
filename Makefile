NAME=syncthing
ORG=derekschaefer
VERSION=0.10.5
SOURCES=Dockerfile
DOWNLOAD=https://github.com/syncthing/syncthing/releases/download
DISTRIBUTION=syncthing-linux-amd64-v$(VERSION)

all: build

clean:
	rm -rf build

download:
	mkdir -p build
	wget -O build/$(NAME).tar.gz $(DOWNLOAD)/v$(VERSION)/$(DISTRIBUTION).tar.gz
	tar -xzf build/$(NAME).tar.gz -C build
	cp build/$(DISTRIBUTION)/syncthing build

build: $(SOURCES)
	docker build -t $(ORG)/$(NAME):latest .
	docker build -t $(ORG)/$(NAME):$(VERSION) .

push: build
	docker push $(ORG)/$(NAME)
