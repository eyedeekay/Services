[Pastebin: Based on Cowyo](pastebin.html)
-----------------------------------------

### Notes:

 - No Special Configuration Required.

```bash
#! /usr/bin/env sh
docker pull schollz/cowyo
docker rm -f pastebin
docker run --restart=always --name=pastebin -d -v $HOME/cowyo-data:/data -p 127.0.0.1:8050:8050 schollz/cowyo
```

