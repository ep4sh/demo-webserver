VERSION := $(shell cat Dockerfile | grep -E version | cut -d '=' -f2 | xargs;)

.PHONY: build
build:
	docker build -t ep4sh/demo-webserver:${VERSION} . ;

.PHONY: push
push: build
	docker push ep4sh/demo-webserver:${VERSION} ;

.PHONY: clean
clean:
	rm *.tgz
