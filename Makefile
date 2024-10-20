SHELL := /bin/bash

.PHONY: deploy
deploy:
	sudo rm -rf /var/www/html
	sudo mkdir /var/www/html
	sudo rsync -av --exclude '.git/' --exclude "Makefile" --exclude "*.org" ./ /var/www/html/ && \
	sudo chown -R www-data:www-data /var/www/html/ && \
	sudo systemctl restart nginx && \
	sudo mv /var/www/html/core.html /var/www/html/index.nginx-debian.html
