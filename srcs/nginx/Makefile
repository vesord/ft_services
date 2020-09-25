build:
	docker build -t nginx:matrus .

run:
	docker run -p 80:80 -p 443:443 -p 21:21 -d nginx:matrus

runit:
	docker run -p 80:80 -p 443:443 -p 21:21 -it nginx:matrus sh

rm:
	docker rm $$(docker ps -aq)
