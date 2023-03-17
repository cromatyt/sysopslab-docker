# Vault

## Docker

`sudo docker run -p 8081:80 -p 8200:8200 -p 1443:443 -p 1234:8080 --name vault-test --cap-add=IPC_LOCK -e AWS_S3_ENDPOINT--mount type=bind,src=$PWD/traefik/traefik.toml,dst=/etc/traefik/traefik.toml --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock -d vault:1.12.3`

$ docker run --cap-add=IPC_LOCK -e 'VAULT_LOCAL_CONFIG={"storage": {"file": {"path": "/vault/file"}}, "listener": [{"tcp": { "address": "0.0.0.0:8200", "tls_disable": true}}], "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui": true}' -p 8200:8200 vault server

## Test

`http://localhost:8200`
