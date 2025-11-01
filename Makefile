.PHONY: run down clean logs

# ==============================================================================
# Docker compose commands

run:
	@echo "Starting docker environment"
	docker-compose -f docker-compose.yml up --build

# ==============================================================================
# Docker support

FILES := $(shell docker ps -aq)

down:
	docker stop $(FILES)
	docker rm $(FILES)

clean:
	docker system prune -f

logs:
	docker logs -f $(FILES)
