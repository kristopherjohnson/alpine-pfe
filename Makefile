NAME=oldmankris/alpine-pfe
TAG=latest

DOCKER_BUILD_FLAGS=--squash

build:
	docker build ${DOCKER_BUILD_FLAGS} --squash -t ${NAME}:${TAG} .

run:
	docker run -it --rm ${NAME}:${TAG}

push:
	docker push ${NAME}:${TAG}

.PHONY: build run push


