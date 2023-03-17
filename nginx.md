# Nginx

## Docker

`sudo docker run -p 8080:80 -p 4443:443 --name nginx-test --mount type=bind,src=$PWD/nginx/html,dst=/usr/share/nginx/html --mount type=bind,src=$PWD/nginx/nginx.conf,dst=/etc/nginx/nginx.conf --mount type=bind,src=$PWD/nginx/default.conf,dst=/etc/nginx/conf.d/default.conf -d nginx:1.23.3-alpine`

## Web

`http://localhost:8080`
