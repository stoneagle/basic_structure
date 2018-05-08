.PHONY: run-web, stop-web rm-web

PWD := $(shell pwd)
USER := $(shell id -u)
GROUP := $(shell id -g)

run-web:       
	cd hack && docker-compose -p "rancher-$(USER)" up

stop-web:
	cd hack && docker-compose -p "rancher-$(USER)" stop 

rm-web:
	cd hack && docker-compose -p "rancher-$(USER)" rm 
