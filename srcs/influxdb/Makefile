build:
	docker build -t influxdb:matrus .

run:
	docker run -p 8086:8086 -d influxdb:matrus

runit:
	docker run -p 8086:8086 -it influxdb:matrus sh

rm:
	docker rm $$(docker ps -aq)
