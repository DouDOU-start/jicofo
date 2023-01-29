#!/bin/bash

docker run -itd --name jicofo --net=host doudou/jmeet-jicofo:v1.0.0

docker exec -it jicofo /bin/bash