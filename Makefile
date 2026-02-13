.PHONY: run run-prod stop down logs clean clean-all env update

COMPOSE=docker compose --env-file .env -f compose.yml

# ==============================================================================
# Docker compose commands

run:
	@echo "Starting local containers..."
	$(COMPOSE) up --build

run-prod:
	@echo "Starting prod containers..."
	$(COMPOSE) up -d --build

# ==============================================================================
# Docker support

stop:
	@echo "Stopping docker containers"
	docker compose stop

down:
	@echo "Stopping and removing all docker containers"
	docker compose down

logs:
	@echo "View docker containers logs..."
	docker compose logs -f

clean:
	@echo "Cleaning docker unused data..."
	docker system prune -f

# DO NOT USE IF YOU DONT KNOW WHAT IT IS
clean-all:
	@echo "Cleaning ALL docker data..."
	docker system prune -a --volumes -f

# ==============================================================================
# Env support

env:
	@test -f .env || cp .env.example .env
	@echo "Env files initialized in "

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
