[Setup Scripts and Notes for Services I Currently Run](index.html)
==================================================================

### Notes:

 - Requires `docker`, `make`, and `bash`(Not `dash` or `mksh`, `bash`), as well
  as an I2P router. UDP services require either i2pd or a freestanding proxy
  capable of supporting UDP traffic.
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
