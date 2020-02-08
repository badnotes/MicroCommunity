#!/bin/bash

cp -r ../bin .

cp  -r ../target .

docker build -t java110/code .

docker run -ti $(cat /etc/hosts|awk -F ' ' '{if(NR>2){print "--add-host "$2":"$1}}') --name code_test -p8003:8003 -idt java110/code:latest

docker logs -f code_test