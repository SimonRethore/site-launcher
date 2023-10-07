clean:
	docker image rm site-launcher:latest clue/json-server:latest
docker-api:
	docker compose exec api sh
docker-web:
	docker compose exec web sh
install:
	docker compose build && \
	npm install
ip:
	docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' site-launcher-web-1
logs-api:
	docker compose logs -f api
logs-web:
	docker compose logs -f web
start:
	docker compose up -d
stop:
	docker compose down
