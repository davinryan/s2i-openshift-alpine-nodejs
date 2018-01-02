
IMAGE_NAME = s2i-openshift-alpine-nodejs

build:
	docker build -t $(IMAGE_NAME) .