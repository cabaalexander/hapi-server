CMD=docker-compose

export IMAGE=cabaalexander/hapi-server:latest
export CONTAINER_NAME=hapi-server

init: build up

attach:
	docker exec -it $(CONTAINER_NAME) sh

sandbox:
	docker run \
		-p 8128:8128 \
		-v ${PWD}/:/app \
		--name $(CONTAINER_NAME)-sandbox \
		--rm -it $(IMAGE) sh

# Removes all the services related
down:
	$(CMD) down

# Starts all the services
up:
	$(CMD) up

# Stop all services related
stop:
	$(CMD) stop

# Removes all images
rm:
	$(CMD) rm -f

# Builds any image for the services
build: down
	$(CMD) build --force-rm \
		&& docker image prune -f

