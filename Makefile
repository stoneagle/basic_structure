.PHONY: run-web, stop-web rm-web

PWD := $(shell pwd)
USER := $(shell id -u)
GROUP := $(shell id -g)
REGISTRY_DEVELOP_PREFIX := stoneagle/develop

run-rancher:       
	cd swarm && docker-compose -f docker-compose-rancher.yml -p "rancher-$(USER)" up
stop-rancher:
	cd swarm && docker-compose -f docker-compose-rancher.yml -p "rancher-$(USER)" stop 
rm-rancher:
	cd swarm && docker-compose -f docker-compose-rancher.yml -p "rancher-$(USER)" rm 

run-db:       
	cd swarm && docker-compose -f docker-compose-database.yml -p "database-$(USER)" up -d
stop-db:
	cd swarm && docker-compose -f docker-compose-database.yml -p "database-$(USER)" stop 
rm-db:
	cd swarm && docker-compose -f docker-compose-database.yml -p "database-$(USER)" rm 

run-envoy:       
	cd swarm && docker-compose -f docker-compose-envoy.yml -p "envoy-$(USER)" up
stop-envoy:
	cd swarm && docker-compose -f docker-compose-envoy.yml -p "envoy-$(USER)" stop 
rm-envoy:
	cd swarm && docker-compose -f docker-compose-envoy.yml -p "envoy-$(USER)" rm 

build-envoy:
	cd dockerfile && docker build -f ./Dockerfile.envoy -t $(REGISTRY_DEVELOP_PREFIX):envoy .
