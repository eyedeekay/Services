[Setting up the I2P Hosts Automatically](host.html)
---------------------------------------------------

### Notes:

 - Hosting this site(The one in this repository) requires a checkout of this
  repository. It can be anywhere, the script finds the correct directory to use.
 - Requires `docker` and `bash`(Not `dash` or `mksh`, `bash`), as well as an
  I2P router. UDP services require either i2pd or a freestanding proxy capable
  of supporting UDP traffic.
 - SAM is expected to be enabled on the I2P Router for some services, including
  hosting this site with eephttpd.

```bash
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
```

