```sh
docker buildx build \
  --platform linux/amd64 \
  -t registry.digitalocean.com/sophiecr/openmf:94e37d1 \
  --build-arg BASE_HREF=/cb/ .
```

```sh
docker run --rm \
  -p 80:8080 \
  --env-file clickfinance.env \
  registry.digitalocean.com/sophiecr/openmf:94e37d1
```
