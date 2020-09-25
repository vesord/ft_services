build:
	docker build -t phpmyadmin:matrus .

run:
	docker run -p 5000:5000 -d phpmyadmin:matrus

runit:
	docker run -p 5000:5000 -it phpmyadmin:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)
