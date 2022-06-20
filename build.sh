#!/bin/bash

exdir=$(dirname `readlink -f "$0"`)
container_image=um34c

args=""

if [ "$1" == "--no-cache" ]; then args="$1"; fi

#--[ build image ]
docker build $args $@ -t $container_image "$exdir"
