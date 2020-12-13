run-local:
	ruby fibonacci.rb*

test:
	bundle exec rspec

docker:
	docker build -t fibonacci-api .

push:
	docker push fibonacci-api
