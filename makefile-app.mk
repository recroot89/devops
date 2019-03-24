USER = "$(shell id -u):$(shell id -g)"

app:
	docker-compose up

app-setup: development-setup-env app-build
	docker-compose run --user=$(USER) app bundle install

app-build:
	docker-compose build

app-bash:
	docker-compose run --user=$(USER) app bash

app-db-prepare:
	docker-compose run --user=$(USER) app bin/rails db:create db:migrate db:fixtures:load

test:
	docker-compose run app bin/rails test
