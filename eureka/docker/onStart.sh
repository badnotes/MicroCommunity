#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/docker-eureka .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name eureka_test -p8761:8761 -idt java110/docker-eureka:latest

docker logs -f eureka_test