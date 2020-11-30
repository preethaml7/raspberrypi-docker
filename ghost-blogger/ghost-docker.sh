DOCKER_VOLUME_PATH="/home/username/docker-data/ghost-blogger"

docker run -d --name ghost-blogger -e url=https://blog.domain.org -p 3001:2368 --restart unless-stopped -v $DOCKER_VOLUME_PATH:/var/lib/ghost/content arm32v7/ghost:latest
