docker-up: memory
	docker-compose up -d

docker-down:
	docker-compose down

docker-build: memory
	docker-compose up --build -d

test:
	docker-compose exec app vendor/bin/phpunit

assets-install:
	docker-compose exec node npm install

assets-rebuild:
	docker-compose exec node npm rebuild node-sass --force

assets-dev:
	docker-compose exec node npm run dev

assets-watch:
	docker-compose exec node npm run watch

queue:
	docker-compose exec app php artisan queue:work

horizon:
	docker-compose exec app php artisan horizon

horizon-pause:
	docker-compose exec app php artisan horizon:pause

horizon-continue:
	docker-compose exec app php artisan horizon:continue

horizon-terminate:
	docker-compose exec app php artisan horizon:terminate

memory:
	sudo sysctl -w vm.max_map_count=262144

perm:
	sudo chgrp -R www-data storage bootstrap/cache
	sudo chmod -R ug+rwx storage bootstrap/cache