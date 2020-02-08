#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/common .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name common_test -p8006:8006 -idt java110/common:latest

docker logs -f common_test