#!/usr/bin/env bash

docker build -t docker-trigger . && docker rm -f trigger; docker run --name trigger -it docker-trigger $1
