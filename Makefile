IMAGE=cabaalexander/hapi-server:latest
CONTAINER_NAME=hapi-server

doom: stop rm

init: build run

sandbox:
	docker run \
		-p 8128:8128 \
		--name $(CONTAINER_NAME) \
		--rm -it $(IMAGE) sh

build:
	docker build -t $(IMAGE) . \
	&& docker image prune -f

run:
	docker run \
		-p 8128:8128 \
		-d \
		--name $(CONTAINER_NAME) $(IMAGE)

stop:
	docker stop $(CONTAINER_NAME)

rm:
	docker rm $(CONTAINER_NAME)

