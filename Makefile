.PHONY: build up down logs migrate superuser shell

DOCKER_ID = pmahesh59
BACKEND_IMAGE = nxttrendz-backend
FRONTEND_IMAGE = nxttrendz-frontend
VERSION = v1
LATEST = latest

build:
	docker compose build
up:
	docker compose up -d --build
down:
	docker compose down
logs:
	docker compose logs -f backend
migrate:
	docker compose exec backend python manage.py migrate
superuser:
	docker compose exec backend python manage.py createsuperuser
shell:
	docker compose exec backend bash



push:
        docker tag $(BACKEND_IMAGE) $(DOCKER_ID)/$(BACKEND_IMAGE):$(VERSION)
        docker tag $(BACKEND_IMAGE) $(DOCKER_ID)/$(BACKEND_IMAGE):$(LATEST)
        docker push $(DOCKER_ID)/$(BACKEND_IMAGE):$(VERSION)
        docker push $(DOCKER_ID)/$(BACKEND_IMAGE):$(LATEST)

		docker tag $(FRONTEND_IMAGE) $(DOCKER_ID)/$(FRONTEND_IMAGE):$(VERSION)
        docker tag $(FRONTEND_IMAGE) $(DOCKER_ID)/$(FRONTEND_IMAGE):$(LATEST)
        docker push $(DOCKER_ID)/$(FRONTEND_IMAGE):$(VERSION)
        docker push $(DOCKER_ID)/$(FRONTEND_IMAGE):$(LATEST)