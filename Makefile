
TAG=land/squid
BASE_IMAGE="ubuntu:trusty"
APT_MIRROR=

all: prepare build

prepare: 
	./prepare.sh "$(BASE_IMAGE)"  "$(APT_MIRROR)" ./Dockerfile
build:
	docker build --rm  --tag=$(TAG)  .
