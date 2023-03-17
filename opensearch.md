# Opensearch

admin:admin

## Docker

`sudo docker run -p 9200:9200 -p 9600:9600 -e "discovery.type=single-node" --name opensearch-node -d opensearchproject/opensearch:2.5.0`

## Docker dash

`sudo docker run -p 5601:5601 --name opensearch-dash -e "DISABLE_SECURITY_DASHBOARDS_PLUGIN=true" -e 'OPENSEARCH_HOSTS=["https://192.168.122.1:9200"]' -d opensearchproject/opensearch-dashboards:2.5.0`

## Test

`curl -X GET "https://localhost:9200" -ku admin:admin`

`curl -X GET "https://localhost:9200/_cat/nodes?v" -ku admin:admin`

`curl -X GET "https://localhost:9200/_cat/plugins?v" -ku admin:admin`

## Web

`http://localhost:5601`
