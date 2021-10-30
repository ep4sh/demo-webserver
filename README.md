# Build
```
export VERSION=$(cat Dockerfile | grep -E version | cut -d '=' -f2 | xargs);
docker build -t ep4sh/demo-webserver:$VERSION . ;
```

# Push
```
export VERSION=$(cat Dockerfile | grep -E version | cut -d '=' -f2 | xargs);
docker push ep4sh/demo-webserver:$VERSION ;
```

# Run
```
export VERSION=$(cat Dockerfile | grep -E version | cut -d '=' -f2 | xargs);
docker -ti -p8888:8888 ep4sh/demo-webserver:$VERSION ;
```

# Helm

## Install
```
k ns default
helm upgrade --install demo-webserver ./demo-webserver-helm-chart -f ./demo-webserver-helm-chart/values.yaml
```

## Package
```
helm package ./demo-webserver-helm-chart
```

## Push to ChartMuseum
```
curl --data-binary "@demo-webserver-0.0.1.tgz" http://<your_host>:<port>/api/charts
```

### Install ChartMuseum
```
k create ns chm
k ns chm
helm install chm chartmuseum/chartmuseum --set env.open.DISABLE_API=false --set env.open.DEBUG=true
```
