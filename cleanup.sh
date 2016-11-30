#!/bin/bash
for dock in haproxy frontend logstash mongo
do
  docker stop $dock
  docker rm $dock
  docker rmi $dock
done
docker network rm training
