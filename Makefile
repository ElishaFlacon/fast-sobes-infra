.PHONY: run-dev run-prod down clean logs

# ==============================================================================
# Docker compose commands

run-dev:
	@echo "Run DEV docker environment"
	docker-compose -f docker-compose.yml up --build

run-prod:
	@echo "Run PROD docker environment"
	docker-compose -f docker-compose.yml up -d --build

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
