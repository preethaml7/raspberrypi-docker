DOCKER_VOLUME_PATH="/home/username/docker-data/redis-server"

## Redis Config File
REDIS_VERSION = 6.0.9
cd $DOCKER_VOLUME_PATH
curl -O https://raw.githubusercontent.com/antirez/redis/$REDIS_VERSION/redis.conf

docker run --name redis-server -v $DOCKER_VOLUME_PATH/redis.conf:/usr/local/etc/redis/redis.conf -d -p 0.0.0.0:6379:6379 --restart unless-stopped arm32v7/redis redis-server /usr/local/etc/redis/redis.conf