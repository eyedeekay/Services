[Setup Scripts and Notes for Services I Currently Run](index.html)
==================================================================

### Notes:

 - Requires `docker` and `bash`(Not `dash` or `mksh`, `bash`), as well as an
  I2P router. UDP services require either i2pd or a freestanding proxy capable
  of supporting UDP traffic.
 - SAM is expected to be enabled on the I2P Router for some services, including
  hosting this site with eephttpd.

### Usage:

```bash
functions: help pages clean install uninstall

help: show this message
pages: generate the pages
clean: clean up the pages
install: setup the cron jobs and shell scripts
uninstall: remove the cron jobs and shell scripts
```

```bash

```

[Setting up the I2P Hosts Automatically](host.html)
---------------------------------------------------

### Notes:

 - Hosting this site(The one in this repository) requires a checkout of this
  repository. It can be anywhere, the script finds the correct directory to use.

### See Also:

 - [Repo](https://github.com/eyedeekay/Services)
 - [Clearnet](https://eyedeekay.github.io/Services)

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
	--volume "$HOME/i2p-services":/opt/eephttpd/keys \
	--volume "$DIR":/opt/eephttpd/www \
	eyedeekay/eephttpd
```

[Docker system Management: Portainer](portainer.html)
-----------------------------------------------------

### Notes:

 - Set up username/password before exposing hidden service
 - Uses Encrypted LeaseSet

```bash
#! /usr/bin/env sh
docker pull portainer/portainer-ce
docker rm -f portainer
docker run -d -p 127.0.0.1:8000:8000 -p 127.0.0.1:9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME"/portainer-data:/data portainer/portainer-ce
```

[Pastebin: Cowyo](pastebin.html)
-----------------------------------------

### Notes:

 - No Special Configuration Required.

```bash
#! /usr/bin/env sh
docker pull schollz/cowyo
docker rm -f pastebin
docker run --restart=always --name=pastebin -d -v $HOME/cowyo-data:/data -p 127.0.0.1:8050:8050 schollz/cowyo
```

[News Server: i2p.newsxml](newsxml.html)
-------------------------------------------------

### Notes:

 - This script expects your i2p.newsxml checkout to exist in `$HOME/i2p.newsxml`
  so that it can build the hosting container in that directory.
 - This is the script that relaunches backup news server for I2P I run.
  Nobody else can really use it without the keys, unless they want to set up 
  another news server on a different URL.
 - This doesn't handle generating or signing the news feeds, just hosting them.
  Generate and sign them on one machine, copy them to the host machine, and run
  the update script.

### See Also:

 - [Gitlab](https://i2pgit.org/i2p-hackers/i2p.newsxml)
 - [Github](https://github.com/i2p/i2p.newsxml)

```bash
#! /usr/bin/env sh
cd $HOME/i2p.newsxml
docker build -t i2p.newsxml .
docker rm -f newsxml
docker run -d --restart=always --name newsxml -p 127.0.0.1:3000:3000 i2p.newsxml
```

[I2P Jpackage Update Server](jpackage.html)
-------------------------------------------

### Notes:

 - This sets up an update server for the I2P Jpackages. It will check out the
  site at `$HOME/i2p-jpackage` and `jpackage.sh` will run the internal
  `update-site.sh` script as a cron job.
 - If you're me, you need to copy `eephttpd-jpackage.i2pkeys` to `$HOME/eephttpd-jpackage-data/`
  before running. If you're not me, I'm just tickled that you're setting up an update server for
  your own fork. Maybe ping me on IRC.

### See Also:

 - [Repo](https://github.com/eyedeekay/i2p)
 - [Clearnet](https://eyedeekay.github.io/i2p)

```bash
#! /usr/bin/env sh
if [ ! -d "$HOME/i2p-jpackage" ]; then
	git clone https://github.com/eyedeekay/i2p "$HOME/i2p-jpackage"
fi
"$HOME/i2p-jpackage/update-site.sh"
```

[I2P Site Mirror: i2p.www](mirror.html)
---------------------------------------

### Notes:

 - No Special Configuration Required.

### See Also:

 - [Gitlab](https://i2pgit.org/i2p-hackers/i2p.www)
 - [Github](https://github.com/i2p/i2p.www)

```bash
#! /usr/bin/env sh

if [ ! -d "$HOME/i2p.www" ]; then
	git clone https://i2pgit.org/i2p-hackers/i2p.www "$HOME/i2p.www"
fi

"$HOME/i2p.www/site-updater-docker.sh"
```

[Wiki: DokuWiki](dokuwiki.html)
----------------------------------------

```bash

```

[Strategy Game: Freeciv Server](freeciv.html)
---------------------------------------------

```bash

```

["Radio" Station:](radio.html)
------------------------------

```bash

```

