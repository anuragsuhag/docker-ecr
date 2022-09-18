#! /bin/bash
docker run -dit --name hello1  httpd
docker cp work.sh hello1:/usr
docker exec hello1 bash -c "/usr/work.sh"

