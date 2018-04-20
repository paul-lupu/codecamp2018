#!/bin/bash

docker pull mysql/mysql-server:5.7

docker run --name=mysql1 -d mysql/mysql-server:5.7

echo "Waiting for mysql to start";

until docker logs mysql1 2>&1 | grep GENERATED; do  echo -n .; sleep 2; done;

sleep 3

docker logs mysql1 2>&1 | grep GENERATED  | awk -F: '{print $2}' | sed -e 's/^[ \t]*//' \
| xargs -I {} docker exec -t mysql1 mysql --connect-expired-password -uroot -p{} -e \
"ALTER USER 'root'@'localhost' IDENTIFIED BY 'codecamp'; 
CREATE USER 'codecamp'@'%' identified by 'codecamp';
CREATE DATABASE codecamp; 
GRANT ALL PRIVILEGES ON codecamp.* TO 'codecamp'@'%';
CREATE TABLE codecamp.messages(message varchar(30));
INSERT INTO codecamp.messages values ('Hello Folks!');"
