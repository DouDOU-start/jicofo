#!/bin/bash

docker rm -f jicofo

docker rm $(docker ps -a -q)

docker rmi $(docker images -f "dangling=true" -q)