DOCKER_CONTAINER_APP ?= cups

## Connect into app container
app/ssh:
	$(call docker-exec, $(DOCKER_CONTAINER_APP), bash)

## Logs docker app
app/logs:
	@docker logs $(DOCKER_CONTAINER_APP)

## Logs follow docker app
app/logs/follow:
	@docker logs -f $(DOCKER_CONTAINER_APP)


## Install hp drivers
app/driver/install:
	$(call docker-exec, $(DOCKER_CONTAINER_APP), bash -c 'hp-setup -i')

## Print test page
app/test/print:
	$(call docker-exec, $(DOCKER_CONTAINER_APP), bash -c 'hp-testpage')

## Run scan
app/test/scan:
	$(call docker-exec, $(DOCKER_CONTAINER_APP), bash -c 'hp-scan')