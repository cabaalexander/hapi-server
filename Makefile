CMD := docker-compose

# Docker
export IMAGE=cabaalexander/hapi-server:latest
export CONTAINER_NAME=hapi-server

# App
export HOST?=0.0.0.0
export PORT?=8128

# Local
PORT_SANDBOX := $(shell echo $$(( $(PORT) + 1 )))

init: build up

# Builds any image for the services
build: down
	$(CMD) build --force-rm \
		&& docker image prune -f

# Starts all the services
up:
	$(CMD) up $(OPTIONS)

# Stops and removes all the services related
down:
	$(CMD) down

start:
	$(CMD) start $(OPTIONS)

stop:
	$(CMD) stop

attach:
	docker exec -it $(CONTAINER_NAME) sh

sandbox:
	docker run \
		-p ${PORT_SANDBOX}:${PORT_SANDBOX} \
		-v ${PWD}/:/app \
		--name $(CONTAINER_NAME)-sandbox \
		--rm -it $(IMAGE) sh

