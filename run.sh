#!/bin/bash

exdir=$(dirname $(readlink -f "$0"))

container=um34c
container_image=um34c
cpus="2"
memory="512m"

"$exdir/dk-rm-if-exists" $container $1

echo -n '---> starting...'

docker -D run \
        -ti \
        -d \
        -e TZ=$(cat /etc/timezone) \
        --privileged \
        --net=host \
        --hostname "$container" \
        --name "$container" \
        --restart="unless-stopped" \
        --cpus="$cpus" \
        --memory="$memory" \
        "$container_image"
