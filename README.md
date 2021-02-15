# kid3-docker

baseimage-gui image with Kid3 installed.

__This image is available on both Docker Hub and Github Container Registry. Please use ghcr since the Docker hub one might dissapear at any given time.__

## Installing

### Via Docker Registry

```shell
$ docker pull ghcr.io/thibmaek/kid3-docker
$ docker run -itd -v ./music:/music:rw -v ./config:/config:rw --name kid3 thibmaek/kid3
```

### Via Docker Compose

See [docker-compose.yaml][./docker-compose.yaml]

```shell
$ docker-compose up -d

# Or using local build:
$ docker-compose -f docker-compose.local.yaml up -d
```
