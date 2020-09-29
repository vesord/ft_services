build:
	docker build -t grafana:matrus .

run:
	docker run -p 3000:3000 -d grafana:matrus

runit:
	docker run -p 3000:3000 -it grafana:matrus sh

rm:
	docker rm $$(docker ps -aq)

st:
	docker stop $$(docker ps -q)
