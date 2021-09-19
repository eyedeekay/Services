[Docker system Management: Portainer](portainer.html)
-----------------------------------------------------

### Notes:

 - Set up username/password before exposing hidden service
 - Uses Encrypted LeaseSet

```bash
#! /usr/bin/env sh
docker pull portainer/portainer-ce
docker rm -f portainer
docker run -d -p 127.0.0.1:8000:8000 -p 127.0.0.1:9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME"/portainer-data:/data portainer/portainer-ce
```

