#! /bin/bash
docker exec -i $1 /bin/bash -c "sh starttest.sh $1"
