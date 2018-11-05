DOCKER_CONTAINER_APP ?= cups

## Connect into app container
app/ssh:
	$(call docker-exec, $(DOCKER_CONTAINER_APP), bash)

## Logs docker drebedengi
app/logs:
	@docker logs $(DOCKER_CONTAINER_APP)

## Logs follow docker drebedengi
app/logs/follow:
	@docker logs -f $(DOCKER_CONTAINER_APP)


## Run init drebedengi container
app/init:
	$(call docker-exec, $(DOCKER_CONTAINER_APP), bash -c './init.sh')