#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/community .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name community_test -p8006:8006 -idt java110/community:latest

docker logs -f community_test