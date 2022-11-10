#!/bin/bash

#
# docker-composer-update.sh
#
REPO="docker/compose"
FILE=docker-compose
URL=`curl -s https://api.github.com/repos/${REPO}/releases/latest | awk -F\" '/browser_download_url.*docker-compose-linux-x86_64.$/{print $(NF-1)}'`

wget -O $FILE $URL
chmod a+x $FILE
