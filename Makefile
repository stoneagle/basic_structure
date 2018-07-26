.PHONY: run-web, stop-web rm-web

PWD := $(shell pwd)
USER := $(shell id -u)
GROUP := $(shell id -g)
PROJ := basic
REGISTRY_DEVELOP_PREFIX := stoneagle/develop

run-all:
	make run SYSTEM=database UPPARAMS="-d" && \
	make run SYSTEM=envoy UPPARAMS="-d" && \
	make run SYSTEM=gogs UPPARAMS="-d"
stop-all:
	make stop SYSTEM=database && \
	make stop SYSTEM=envoy && \
	make stop SYSTEM=gogs
rm-all:
	make rm SYSTEM=database && \
	make rm SYSTEM=envoy && \
	make stop SYSTEM=gogs

# system can be rancher, database, envoy, gogs
run:
	cd swarm && docker-compose -f docker-compose-$(SYSTEM).yml -p "$(PROJ)-$(USER)-$(SYSTEM)" up $(UPPARAMS)
stop:
	cd swarm && docker-compose -f docker-compose-$(SYSTEM).yml -p "$(PROJ)-$(USER)-$(SYSTEM)" stop 
rm:
	cd swarm && docker-compose -f docker-compose-$(SYSTEM).yml -p "$(PROJ)-$(USER)-$(SYSTEM)" rm 

build-envoy:
	cd dockerfile && docker build -f ./Dockerfile.envoy -t $(REGISTRY_DEVELOP_PREFIX):envoy .
