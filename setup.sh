#!/bin/bash
docker network create --driver bridge training
docker run --network=training -d --name mongo mongo mongod --rest
cd logstash
docker build . --tag logstash
docker run --network=training -d --name logstash logstash
cd ../frontend
docker build . --tag frontend
docker run --network=training -d --name frontend frontend
cd ../haproxy
docker build . --tag haproxy
docker run --network=training -d -p 80:80 --name haproxy haproxy
docker ps --format "table {{.Image}}\t{{.Ports}}\t{{.Names}}"
