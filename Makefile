APP_NAME = hotelprice
VERSION = latest

DOCKERFILE = Dockerfile

.PHONY: all build run stop clean

build:
	docker build -t $(APP_NAME):$(VERSION) -f $(DOCKERFILE) .

run:
	docker run --name $(APP_NAME) --env-file .env $(APP_NAME):$(VERSION)

stop:
	docker stop $(APP_NAME) || true
	docker rm $(APP_NAME) || true

clean:
	docker rmi $(APP_NAME):$(VERSION) || true
	docker system prune -f

rebuild: stop clean build run

update-libs:
	pip install -r ./requirements.txt
	pip freeze > ./requirements.txt

docker-build-and-push:
	docker buildx build --no-cache --platform linux/amd64 -t cr.selcloud.ru/ohack/server:v0.0.1 .
	docker login -u token -p CRgAAAAAApK5DFBjP8DNgQXJN-zG5rDB7sUbBSdW cr.selcloud.ru/ohack
	docker push cr.selcloud.ru/ohack/server:v0.0.1

