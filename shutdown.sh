#!/bin/bash

docker stop springc
docker stop db
docker rm springc
docker rm db
docker network rm mired
