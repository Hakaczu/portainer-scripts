#!/bin/bash

port=$(../get_mikrus_port.sh)

docker run -d \
-p 20$port:9001 \
--name portainer-agent \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /var/lib/docker/volumes:/var/lib/docker/volumes \
portainer/agent:latest
