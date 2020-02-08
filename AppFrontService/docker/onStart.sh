#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/appFront .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name appFront_test -p8012:8012 -idt java110/appFront:latest

docker logs -f appFront_test