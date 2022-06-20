#!/bin/bash

docker logs -n 1 -f um34c | while read line; do echo "$(echo $line | jq -r .voltage)V"; done