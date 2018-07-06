CMD=docker-compose

export IMAGE=cabaalexander/hapi-server:latest
export CONTAINER_NAME=hapi-server

init: build up

down:
	$(CMD) down

up:
	$(CMD) up

stop:
	$(CMD) stop

rm:
	$(CMD) rm -f

build: down
	$(CMD) build --force-rm \
		&& docker image prune -f

sandbox:
	docker run \
		-p 8128:8128 \
		-v ${PWD}/:/app \
		--name $(CONTAINER_NAME)-sandbox \
		--rm -it $(IMAGE) sh

attach:
	docker exec -it $(CONTAINER_NAME) sh

