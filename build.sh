#!/bin/bash

echo "Building latest for master"
docker build \
	--build-arg DOWNLOAD_URL=$DOWNLOAD_URL \
	--tag "aerogear/grafana:master" \
	--no-cache=true .

