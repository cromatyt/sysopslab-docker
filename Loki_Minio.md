# Minio

## Docker

`sudo docker run -d --name=minio -p 9000:9000 -p 9001:9001 minio/minio server /data --console-address ":9001"`

minioadmin:minioadmin

## Install Minio client

```bash
https://min.io/docs/minio/linux/reference/minio-mc.html
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/minio-binaries/mc
```

`chmod +x $HOME/minio-binaries/mc`

`export PATH=$PATH:$HOME/minio-binaries/`

## Create Minio client alias

`mc alias set ALIAS HOSTNAME ACCESS_KEY SECRET_KEY`

ex: `mc alias set loki http://localhost:9000 XXXX XXXX`

`mc alias ls`

## Some usecase

`mc cp test.txt ALIAS/BUCKET_NAME`

`mc ls --summarize ALIAS/BUCKET_NAME`

`mc rm ALIAS/BUCKET_NAME/FILE_NAME`

## POLICY

:warning: When you create an access key, it's seems like it keep your policy at the moment t
If you modify your policy, create a new access key :warning:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME/*"
            ]
        }
    ]
}
```

# Loki

## Docker

`sudo docker run -d --name loki --mount type=bind,source="$PWD/loki.yaml",target=/etc/loki/local-config.yaml -p 3100:3100 grafana/loki`

# Promtail

## Docker

`sudo docker run -d --name promtail --mount type=bind,source="$PWD/promtail.yaml",target=/etc/promtail/config.yml -p 9080:9080 grafana/promtail`

# Grafana

admin:admin

## Docker

`sudo docker run -d --name=grafana -p 3000:3000 grafana/grafana`
