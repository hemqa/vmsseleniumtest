#! /bin/bash
nohup Xvfb :10 -ac &
export DISPLAY=:10
firefox --safe-mode &
mvn -f $1/pom.xml test
kill -9 $(pgrep Xvfb)
