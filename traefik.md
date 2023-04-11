# Traefik

## Docker

:warning: prefert docker-compose :warning:
`sudo docker run -p 8081:80 -p 1443:443 -p 1234:8080 --name traefik-test --mount type=bind,src=$PWD/traefik/traefik.toml,dst=/etc/traefik/traefik.toml --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -d traefik:v2.9.6`

## Interface Web

`http://localhost:8080`

## Test

`curl --header 'Host:XXXX.docker.localhost' 'http://localhost'`
