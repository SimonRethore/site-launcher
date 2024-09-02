clean:
	docker image rm site-launcher:latest
docker:
	docker compose exec web sh
install:
	docker compose build && \
	npm install --force
ip:
	docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' site-launcher
logs:
	docker compose logs -f web
start:
	docker compose up -d
stop:
	docker compose down