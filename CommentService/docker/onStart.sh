#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/comment .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name comment_test -p8008:8008 -idt java110/comment:latest

docker logs -f comment_test