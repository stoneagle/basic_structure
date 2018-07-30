.PHONY: run-web, stop-web rm-web

PWD := $(shell pwd)
USER := $(shell id -u)
USERNAME := $(shell id -nu)
GROUP := $(shell id -g)
PROJ := basic
REGISTRY_DEVELOP_PREFIX := stoneagle/develop

run-all:
	make run SYSTEM=database UPPARAMS="-d" && \
	make run SYSTEM=envoy UPPARAMS="-d" && \
	make run SYSTEM=gogs UPPARAMS="-d" && \
	make run SYSTEM=drone UPPARAMS="-d"
stop-all:
	make stop SYSTEM=database && \
	make stop SYSTEM=envoy && \
	make stop SYSTEM=gogs && \
	make stop SYSTEM=drone
rm-all:
	make rm SYSTEM=database && \
	make rm SYSTEM=envoy && \
	make rm SYSTEM=gogs && \
	make rm SYSTEM=drone

# system can be rancher, database, envoy, gogs, drone
run:
	cd swarm && docker-compose -f docker-compose-$(SYSTEM).yml -p "$(PROJ)-$(USER)-$(SYSTEM)" up $(UPPARAMS)
stop:
	cd swarm && docker-compose -f docker-compose-$(SYSTEM).yml -p "$(PROJ)-$(USER)-$(SYSTEM)" stop 
rm:
	cd swarm && docker-compose -f docker-compose-$(SYSTEM).yml -p "$(PROJ)-$(USER)-$(SYSTEM)" rm 

build-envoy:
	cd dockerfile && docker build -f ./Dockerfile.envoy -t $(REGISTRY_DEVELOP_PREFIX):envoy .

init-mysql-db:
	docker run --rm --network=$(USERNAME) -v $(PWD)/config:/tmp mysql:8.0.11 /bin/bash /tmp/mysql-init.sh
