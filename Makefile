COMPOSE_FILE := docker/docker-compose.yml

.PHONY: up down build logs restart clean help

up:
	docker compose -f $(COMPOSE_FILE) up -d

build:
	docker compose -f $(COMPOSE_FILE) up --build -d

down:
	docker compose -f $(COMPOSE_FILE) down

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

restart:
	docker compose -f $(COMPOSE_FILE) restart

clean:
	docker compose -f $(COMPOSE_FILE) down --rmi all --volumes --remove-orphans

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  up        Start the application"
	@echo "  build     Build and start the application"
	@echo "  down      Stop the application"
	@echo "  logs      View logs (follow mode)"
	@echo "  restart   Restart the application"
	@echo "  clean     Remove everything (containers, images, volumes)"
	@echo "  help      Show this help message"
