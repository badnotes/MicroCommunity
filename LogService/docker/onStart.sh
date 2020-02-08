#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/log .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name log_test -p8004:8004 -idt java110/log:latest

docker logs -f log_test