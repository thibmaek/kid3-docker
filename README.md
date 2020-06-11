# kid3-docker

baseimage-gui image with Kid3 installed.

## Installing

### Via Docker Registry

```shell
$ docker pull thibmaek/kid3
$ docker run -itd -v ./music:/music:rw -v ./config:/config:rw --name kid3 thibmaek/kid3
```

### Via Docker Compose

See [docker-compose.yaml][./docker-compose.yaml]

```shell
$ docker-compose up -d

# Or using local build:
$ docker-compose -f docker-compose.local.yaml up -d
```
