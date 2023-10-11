# Pulling variables from .env
include .env
export

# Check if app_name and app_version are set, if not, exit with an error
ifndef APP_NAME
$(error app_name is not set in .env)
endif

ifndef APP_VERSION
$(error app_version is not set in .env)
endif

# Target to build the Docker service using docker-compose
build:
	docker-compose build $(app_name)

# Target to run the Docker service using docker-compose
run: build
	docker-compose up $(app_name)

# Target to stop Docker service using docker-compose
down:
	docker-compose down

# Target to stop and remove Docker service
clean:
	docker-compose down --volumes

# Target to push the Docker image to a remote repository
push:
	docker-compose push $(app_name)

.PHONY: build run down clean push
