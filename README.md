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
``
