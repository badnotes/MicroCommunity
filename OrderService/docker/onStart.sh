#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/order .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name order_test -p8001:8001 -idt java110/order:latest

docker logs -f order_test