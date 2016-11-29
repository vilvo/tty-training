```
docker run --network=training -d --name mongo -p 27017:27017 -p 28017:28017 mongo mongod --rest
docker run --network=training -d -p 8000:8000 --name frontend frontend
docker run --network=training -d -p 80:80 --name haproxy haproxy
docker run --network=training -d -p 2000:2000 --name logstash logstash

IMAGE               COMMAND                  PORTS                                                NAMES
logstash            "/docker-entrypoint.s"   0.0.0.0:2000->2000/tcp                               logstash
haproxy             "/docker-entrypoint.s"   0.0.0.0:80->80/tcp                                   haproxy
frontend            "httpd-foreground"       80/tcp, 0.0.0.0:8000->8000/tcp                       frontend
mongo               "/entrypoint.sh mongo"   0.0.0.0:27017->27017/tcp, 0.0.0.0:28017->28017/tcp   mongo
```
