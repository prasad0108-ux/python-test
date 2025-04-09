image:
	docker build -t prasads01/python-webapp:latest .

push:
	docker push prasads01/python-webapp:latest

test:
	pytest tests/
