#! /bin/bash

set -eux 
docker stop $1
docker rm $1
