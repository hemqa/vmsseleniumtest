#! /bin/bash
kill -9 $(pgrep Xvfb)
useradd jenkins
chown -R jenkins:jenkins /root/*
nohup Xvfb :10 -ac &
export DISPLAY=:10
firefox --safe-mode &
mvn -f /root/pom.xml test
kill -9 $(pgrep Xvfb)
chown -R jenkins:jenkins /root/*
