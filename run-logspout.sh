#!/usr/bin/env bash

if [ "$(docker ps -f name=logspout-1 --format "{{.Names}}" | wc -l)" -eq "0" ] ; then
  echo "Creating logspout-1"
  docker run \
  --name logspout-1 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 9001:80 \
  -d gliderlabs/logspout:latest \
  syslog://logs.papertrailapp.com:55555 1> /dev/null

  sleep 5
else
  echo "Already running a logspout-1 container"
fi

echo "Displaying logs..."
curl http://localhost:9001/logs