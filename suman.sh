#! /bin/bash
docker pull httpd
docker run -dit --name hello1  httpd
docker cp ./work.sh hello1:/usr
docker ps
docker exec hello1 bash -c "/usr/work.sh"

