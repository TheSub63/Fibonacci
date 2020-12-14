# Fibonacci API

Cette API permet de calculer le résultat de la fonction de Fibonacci, d'obtenir l'index de Fibonnaci le plus proche d'un nombre et de faire des calculs de Fibonacci avec mise en cache pour une meilleure performances sur de grands nombres.
Elle est inspirée de https://github.com/nicgrayson/fibonacci-api pour le calcul initial et l'usage de Sinatra et utilise la formule de http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html#section1 pour la formule inversée.
## Usage

### GET /fibo/:number

#### When :number is positive

Fibonacci API Returns :number of fibonacci numbers

#### When :number is negative

Fibonacci returns a 400 status code

### GET /fibo_inv/:number

#### When :number is positive

Retourne l'index de Fibonacci le plus proche de number

#### When :number is negative

Fibonacci returns a 400 status code

### GET /fibo_cache/:number

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
