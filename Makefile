
IMAGE_NAME = s2i-alpine-nodejs

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
