#! /usr/bin/env sh

if [ ! -d "$HOME/i2p.www" ]; then
	git clone https://i2pgit.org/i2p-hackers/i2p.www "$HOME/i2p.www"
fi

"$HOME/i2p.www/site-updater-docker.sh"
