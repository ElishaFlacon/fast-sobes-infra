.PHONY: dev run-dev run-prod down stop clean logs update

# ==============================================================================
# Docker compose commands

run-dev:
	@echo "Starting dev docker containers..."
	docker compose -f docker-compose.yml up --build

run-dev:
	@echo "Starting dev docker containers..."
	docker compose -f docker-compose.yml up --build

run-prod:
	@echo "Starting prod docker containers..."
	docker compose -f docker-compose.yml up -d --build

# ==============================================================================
# Docker support

down:
	@echo "Stopping and removing all docker containers"
	docker compose down

stop:
	@echo "Stopping docker containers"
	docker compose stop

clean:
	docker system prune -f

logs:
	docker logs -f

# ==============================================================================
# CI\CD support

update:
	@echo "Updating project (PRODUCTION)"
	@echo "Pulling last commits..."
	git pull origin main
	@echo "Stopping docker containers..."
	docker compose down
	@echo "Starting docker containers..."
	docker compose up -d --build
