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
- [ ] gitea # GUI ok, git clone ssh KO (stockage minio ?)
- [ ] drone io # runner network
- [ ] vault # config
- [x] redis
- [x] glauth
- [x] opensearch
- [x] opensearch dashboard
- [ ] harbor
- [x] zabbix (here with psql)
- [x] kafka ?

---

# How to start

Run docker-compose file:

`sudo docker-compose up -d"

-d option for detach containers.
# Configure git

A git profile par folder ?
Edit your `.gitconfig` file:

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

Create your `.gitconfig-custom` file:

```yaml
[core]
    sshCommand = "ssh -i path/to/custom/ssh/key"

[user]
    name = custom username
    email = custom@email.addr
```

For checking:

- Go to your gitdir path
- execute `git init` your folder isn't a git repository
- look at `git config -l` output

# Gitea

If you forgot to create admin user at gitea initialization, go to gitea container and create an admin gitea user:

`sudo docker exec -it gitea /bin/bash`

`gitea admin user create --username giteaadmin --password giteaadmin -email admin@admin.com --admin`

# Drone io

Configure OAuth2:
Connect to gitea with an admin account

- Website Administration => Applications

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
