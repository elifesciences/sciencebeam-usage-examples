USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

JUPYTER_DOCKER_COMPOSE = USER_ID="$(USER_ID)" GROUP_ID="$(GROUP_ID)" \
	docker-compose

JUPYTER_DEV_RUN = $(JUPYTER_DOCKER_COMPOSE) run --rm \
	--workdir=/home/jovyan \
	jupyter


.require-%:
	@ if [ "${${*}}" = "" ]; then \
			echo "Environment variable $* not set"; \
			exit 1; \
	fi


jupyter-build:
	$(JUPYTER_DOCKER_COMPOSE) build


jupyter-start:
	$(JUPYTER_DOCKER_COMPOSE) up -d


jupyter-logs:
	$(JUPYTER_DOCKER_COMPOSE) logs -f


jupyter-stop:
	docker-compose down -v


jupyter-run-and-test-all-notebooks:
	$(JUPYTER_DEV_RUN) \
		jupyter nbconvert \
		--to=notebook \
		--output-dir="/tmp/ran-notebooks" \
		--execute \
		"notebooks/**/*.ipynb"