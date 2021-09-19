#! /usr/bin/env sh
if [ ! -d "$HOME/i2p-jpackage" ]; then
	git clone https://github.com/eyedeekay/i2p "$HOME/i2p-jpackage"
fi
"$HOME/i2p-jpackage/update-site.sh"
