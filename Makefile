USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

JUPYTER_DOCKER_COMPOSE = USER_ID="$(USER_ID)" GROUP_ID="$(GROUP_ID)" \
	docker-compose


jupyter-build:
	$(JUPYTER_DOCKER_COMPOSE) build


jupyter-start:
	$(JUPYTER_DOCKER_COMPOSE) up -d


jupyter-logs:
	$(JUPYTER_DOCKER_COMPOSE) logs -f


jupyter-stop:
	docker-compose down -v
