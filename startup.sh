#!/bin/bash

docker build -t springapp .
docker network create mired
docker run --name=db -e MYSQL_DATABASE=bdtest -e MYSQL_ROOT_PASSWORD=123456 --network=mired -d mariadb
docker run --name=springc -p 8080:8080 --network=mired --env-file=.env -d springapp

