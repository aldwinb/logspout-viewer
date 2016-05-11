#!/usr/bin/env bash

docker run \
  --name logspout-1 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 9001:80 \
  -d gliderlabs/logspout:latest \
  syslog://logs.papertrailapp.com:55555 1> /dev/null

curl http://localhost:9001/logs