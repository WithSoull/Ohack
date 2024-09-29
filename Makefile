APP_NAME = hotelprice
VERSION = latest

DOCKERFILE = Dockerfile

.PHONY: all build run stop clean

build:
	docker build -t $(APP_NAME):$(VERSION) -f $(DOCKERFILE) .

run:
	docker run -d --name $(APP_NAME) --env-file .env $(APP_NAME):$(VERSION)

stop:
	docker stop $(APP_NAME) || true
	docker rm $(APP_NAME) || true

clean:
	docker rmi $(APP_NAME):$(VERSION) || true
	docker system prune -f

rebuild: stop clean build run
