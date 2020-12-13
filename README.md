# API Fibonacci

Cette API permet de calculer le résultat de la fonction de Fibonacci, d'obtenir l'index de Fibonnaci le plus proche d'un nombre et de faire des calculs de Fibonacci avec mise en cache pour une meilleure performances sur de grands nombres.
Elle est inspirée de https://github.com/nicgrayson/fibonacci-api pour le calcul initial et l'usage de Sinatra et utilise la formule de http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/fibFormula.html#section1 pour la formule inversée.

## Usage

### GET /fibo/:number

#### Quand number est positif

L'API retourne le résultat du calcul de la fonction de Fibonacci

#### Sinon
Renvoie une erreur 400

### GET /fibo_inv/:number

#### Quand number est positif

Retourne l'index de Fibonacci le plus proche de number


#### Sinon
Renvoie une erreur 400

### GET /fibo_cache/:number
#### Quand number est positif

L'API retourne le résultat du calcul de la fonction de Fibonacci

#### Sinon
Renvoie une erreur 400

## Déploiment
