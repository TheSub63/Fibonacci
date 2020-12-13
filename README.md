# Fibonacci API

Fibonacci API is a simple REST API to return n number of fibonacci numbers in an array.

## Usage

### GET /:number

#### When :number is positive

Fibonacci API Returns :number of fibonacci numbers

#### When :number is negative

Fibonacci returns a 400 status code

## Deployment

Fibonacci API ships with a Dockerfile to create a docker image for deployment. The api listens on port 4567.

### Build docker image

`make docker`

### Push

`make push`

### Docker Run

`docker run -d -p "80:4567" fibonacci-api`

## Development

### Run the API locally

Run the following to start the API on localhost:4567

`make run-local`

### Run rspec tests

`make test`
