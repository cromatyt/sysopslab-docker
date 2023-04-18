<h1 style="text-align: center;">docker-compose testing environment</h1>

## Todo

- [x] traefik v2
- [x] nginx
- [x] varnish
- [x] postgres
- [x] pgadmin4
- [x] minio
- [x] keycloak
- [x] grafana
- [x] prometheus
- [ ] loki # s3 config
- [x] promtail
- [x] fluent-bit
- [ ] netdata # config
- [x] gitea
- [x] drone
- [x] drone-runner
- [ ] vault # config
- [x] redis
- [x] glauth
- [x] opensearch
- [x] opensearch dashboard
- [ ] caddy ?
- [ ] coredns or bind9
- [x] zabbix (here with psql)

---

# How to start

Run docker-compose file:

`sudo docker-compose up -d`

-d option for detach containers.
# Configure git multi account

A git profile par folder ?
Edit your `.gitconfig` file (home directory):

```yaml
[core]
    editor = vim

[user]
    name = default username
    email = defaut@email.addr
[init]
    defaultBranch = main

[includeIf "gitdir/i:/your/path/"]
    path = /your/path/.gitconfig-custom
```

Create your `.gitconfig-custom` file in your current directory (under your home dir):

```yaml
[core]
    sshCommand = "ssh -i path/to/custom/ssh/key"

[user]
    name = custom username
    email = custom@email.addr
```

# Gitea

If you forgot to create admin user at gitea initialization, go to gitea container and create an admin gitea user:

`sudo docker exec -it gitea /bin/bash`

`gitea admin user create --username giteaadmin --password giteaadmin -email admin@admin.com --admin`

# Drone io

Configure OAuth2:
Connect to gitea with an admin account

- Website Administration => Applications

URL Redirect => http://drone.docker.localhost/login

Copy CLIENT_ID and CLIENT_SECRET to docker compose drone section

You will be redirect to http://drone.docker.localhost/register, juste go to http://drone.docker.localhost/ instead

Create a .dorne.yml file like:

```yaml
kind: pipeline
type: docker
name: default

steps:
- name: greeting
  image: bash:5.1-alpine3.17
  commands:
  - echo "it's work"
```

# Redis

Check redis:

`redis-cli -h redis.docker.localhost PING`

Should display "PONG"

# Glauth

You can config glauth by editing glauth.conf

With the defautl config file, check ldap acces by executing :

`ldapsearch -x -LLL -H ldap://glauth.docker.localhost:3893 -b "dc=glauth,dc=com" -D "cn=serviceuser,dc=glauth,dc=com" -W`

# Opensearch

Check if your deploy is ok:

`curl -X GET --insecure -u 'admin:admin' https://opensearch.docker.localhost:9200`

# Zabbix

Default zabbix account/password:

Admin/zabbix

# End

After `sudo docker-compose down`, clean unused docker volumes:

`sudo docker volume prune`
