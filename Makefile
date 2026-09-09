clean:
	docker image rm site-launcher:latest
docker:
	docker compose exec web sh
install:
	test -f src/assets/data.json || cp src/assets/data.json.example src/assets/data.json
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