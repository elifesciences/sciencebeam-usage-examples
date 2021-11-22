USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

JUPYTER_DOCKER_COMPOSE = USER_ID="$(USER_ID)" GROUP_ID="$(GROUP_ID)" \
	docker-compose

JUPYTER_DEV_RUN = $(JUPYTER_DOCKER_COMPOSE) run --rm \
	--workdir=/home/jovyan \
	jupyter

# Cells starts scrolling horizontally after 116 characters
NOTEBOOK_MAX_LINE_LENGTH = 116
NOTEBOOK_PYLINT_EXCLUSIONS = pointless-statement,expression-not-assigned,trailing-newlines,wrong-import-position,redefined-outer-name,wrong-import-order


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


jupyter-notebook-lint:
	$(JUPYTER_DEV_RUN) \
	bash -c ' \
		jupyter nbconvert \
			--to=script \
			--output-dir=./.temp/converted-notebooks/ \
			./notebooks/**/*.ipynb \
		&& python -m pylint ./.temp/converted-notebooks/*.py \
			--max-line-length=$(NOTEBOOK_MAX_LINE_LENGTH) \
			--disable=$(NOTEBOOK_PYLINT_EXCLUSIONS) \
	'


jupyter-run-and-test-all-notebooks:
	$(JUPYTER_DEV_RUN) \
		jupyter nbconvert \
		--to=notebook \
		--output-dir="/tmp/ran-notebooks" \
		--execute \
		"./notebooks/**/*.ipynb"