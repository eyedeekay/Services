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

 - [Repo](https://github.com/i2p/i2p.newsxml)
 - [Gitlab](https://i2pgit.org/i2p-hackers/i2p.newsxml)
