api:
	ruby fibonacci.rb*

gui:
	ruby gui.rb*

docker:
	docker build -t fibonacci-api .

push:
	docker push fibonacci-api
