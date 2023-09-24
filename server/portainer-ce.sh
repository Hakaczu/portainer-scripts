#!/bin/bash

port=$(../get_mikrus_port.sh)

if [ "$(docker volume ls -f name=portainer_data | awk '{print $NF}' | grep -E '^'portainer_data'$')" ]; then
    return 0
else
    return 1
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
