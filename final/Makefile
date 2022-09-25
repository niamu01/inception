DATA_PATH=/home/yeju/data

.PHONY: all
all: host build

.PHONY: host
host:
	@sudo sed -i "s/localhost/yeju.42.fr/g" /etc/hosts

.PHONY: build
build:
	@mkdir -p ${DATA_PATH}/wordpress-volumes
	@mkdir -p ${DATA_PATH}/db-volumes
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

.PHONY: stop
stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

.PHONY: clean
clean:
	@sudo rm -rf $(HOME)/data

.PHONY: fclean
fclean: stop clean
	docker system prune -a

.PHONY: re
re: stop fclean all

.PHONY: ls
ls:
	@echo ==============IMAGES==============
	@docker images
	@echo ==============NETWORK==============
	@docker network ls
	@echo ==============PS-ALL==============
	@docker ps -a