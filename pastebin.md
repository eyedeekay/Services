[Pastebin: Cowyo](pastebin.html)
-----------------------------------------

### Notes:

 - No Special Configuration Required.

### Public URLs:

 - [glue.idk.i2p](http://glue.idk.i2p)
 - \[paste.idk.i2p\]\(http://paste.idk.i2p\) Will Replace this service week of 20 September, 2021

```bash
#! /usr/bin/env sh
docker pull schollz/cowyo
docker rm -f pastebin
docker run --restart=always --name=pastebin -d -v $HOME/cowyo-data:/data -p 127.0.0.1:8050:8050 schollz/cowyo
```

