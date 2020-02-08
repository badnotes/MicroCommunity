#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/store .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name store_test -p8006:8006 -idt java110/store:latest

docker logs -f store_test