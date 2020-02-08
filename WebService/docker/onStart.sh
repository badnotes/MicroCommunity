#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/web .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name web_test -p8443:8443 -idt java110/web:latest

docker logs -f web_test