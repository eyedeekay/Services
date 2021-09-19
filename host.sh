#!/usr/bin/env bash

DIR=$(dirname "$(readlink -f "$0")")

docker pull eyedeekay/eephttpd
docker rm -f i2pservices
docker run -i -t -d \
	--env samhost="localhost" \
	--env samport=7656 \
	--env args="-r -p 7672 -n eephttpd-jpackage" \
	--network host \
	--hostname i2pservices \
	--name i2pservices \
	--restart always \
	--volume "$DIR":/opt/eephttpd/www \
	eyedeekay/eephttpd
