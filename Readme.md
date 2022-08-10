AscensionChat Docker
==============

AscensionChat is a Discord integration chat bot for old versions of World of Warcraft.

This repo builds a docker image to run [AscensionChat](https://github.com/Szyler/AscensionChat).

The image is build monthly by a cron trigger and pushed to [dockerhub](https://hub.docker.com/repository/docker/nope01/ascensionchat-docker).

The architectures supported by this image are:

| Architecture |
| :----: |
| amd64 |
| armv8 |
| armv7 |
| armv6 |

---
### docker-compose 
```
---
version: "3"

services:
  ascensionchat:
    image: nope01/ascensionchat-docker:latest
    container_name: ascensionchat
    volumes:
      - path/to/config/wowchat.conf:/wowchat.conf
    restart: unless-stopped
```

### docker CLI

```
$ docker run -d \
  --name=ascensionchat \
  -v path/to/config/wowchat.conf:/wowchat.conf \
  --restart unless-stopped \
  nope01/ascensionchat-docker:latest
```

---
Edit the https://github.com/Szyler/AscensionChat/blob/master/src/main/resources/wowchat.conf to your needs and copy it into your /path/to/config directory. Now restart or deploy the container to apply the config changes.

---
There is also a `next` tag available with support for memory limitation.
### docker-compose 
```
---
version: "2"

services:
  wowchat-next:
    image: nope01/ascensionchat-docker:next
    container_name: wowchat-next
    volumes:
      - path/to/config/wowchat.conf:/wowchat.conf
    restart: unless-stopped
    mem_limit: 250M
```
