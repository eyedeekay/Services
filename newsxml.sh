#! /usr/bin/env sh
cd $HOME/i2p.newsxml
docker build -t i2p.newsxml .
docker rm -f newsxml
docker run -d --restart=always --name newsxml -p 127.0.0.1:3000:3000 i2p.newsxml
