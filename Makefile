NAME ?= catalog

# Target to build the Docker service using docker-compose
build:
	docker-compose build $(NAME)

# Target to run the Docker service using docker-compose
run: build
	docker-compose up $(NAME)

# Target to stop Docker service using docker-compose
down:
	docker-compose down

# Target to stop and remove Docker service
clean:
	docker-compose down --volumes

# Target to push the Docker image to a remote repository
push:
	docker-compose push $(NAME)

.PHONY: build run down clean push
