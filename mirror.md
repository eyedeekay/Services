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

