#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/user .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name user_test -p8002:8002 -idt java110/user:latest

docker logs -f user_test