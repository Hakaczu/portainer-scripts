#!/bin/bash

port=$(../get_mikrus_port.sh)

if ! docker volume ls | grep -q portainer_data ; then
    docker volume create portainer_data
fi

docker run -d \
-p 20$port:8000 \
-p 30$port:9000 \
-p 9443:9443 \
--name portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce:latest
