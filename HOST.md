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
