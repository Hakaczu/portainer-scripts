#!/bin/bash

docker tag portainer/agent:latest portainer/agent:backup
docker image rm portainer/agent:latest
if docker pull portainer/agent:latest; then
    docker stop portainer-agent
    docker rm portainer-agent
    bash ./portainer-agent.sh
else
    echo "Error pulling new image"
fi
