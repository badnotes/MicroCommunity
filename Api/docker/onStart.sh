#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/api .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name api_test -p8008:8008 -idt java110/api:latest

docker logs -f api_test