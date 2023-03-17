# Global

## Purge container stopped

`sudo docker container prune`

## Restart container

`sudo docker restart CONTAINER_ID`

## Manage docker network

`sudo docker network create --subnet=X.X.0.0/24 MY_SUBNET_NAME` # default driver bridge

Use your subnet

`sudo docker run --net MY_SUBNET_NAME --ip X.X.0.2 -it $image bash`
