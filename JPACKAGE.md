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
