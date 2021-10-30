VERSION := $(shell cat Dockerfile | grep -E version | cut -d '=' -f2 | xargs;)
CHART_VERSION := $(shell cat demo-webserver-helm-chart/Chart.yaml | grep version: | cut -d ':' -f2 | xargs;)
CHART_MUSEUM_URL := $(shell echo ${CHART_MUSEUM_URL})

.PHONY: docker-build
docker-build:
	docker build -t ep4sh/demo-webserver:${VERSION} . ;

.PHONY: docker-push
docker-push: docker-build
	docker push ep4sh/demo-webserver:${VERSION} ;


.PHONY: helm-package
helm-package: clean
	helm package ./demo-webserver-helm-chart

.PHONY: helm-push
helm-push: helm-package
	curl --data-binary "@demo-webserver-${CHART_VERSION}.tgz" ${CHART_MUSEUM_URL}api/charts

.PHONY: clean
clean:
	rm *.tgz
