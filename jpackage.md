I2P Jpackage Update Server
--------------------------

### Notes:

 - This sets up an update server for the I2P Jpackages. It will check out the
  site at `$HOME/i2p-jpackage` and `jpackage.sh` will run the internal
  `update-site.sh` script as a cron job.
 - If you're me, you need to copy `eephttpd.i2pkeys` to `$HOME` before running.
  If you're not me, I'm just tickled that you're setting up an update server for
  your own fork. Maybe ping me on IRC.

```bash
#! /usr/bin/env sh
if [ ! -d "$HOME/i2p-jpackage" ]; then
	git clone https://github.com/eyedeekay/i2p "$HOME/i2p-jpackage"
fi
"$HOME/i2p-jpackage/update-site.sh"
```

