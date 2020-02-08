#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/hardwareAdapation .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name hardwareAdapation_test -p8010:8010 -idt java110/hardwareAdapation:latest

docker logs -f hardwareAdapation_test