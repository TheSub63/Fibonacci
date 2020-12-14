# Fibonacci
API pouvant calculer une fonction de Fibonnaci rapidement, ou trouver l'index de Fibonnaci approché d'un nombre. Technos utilisés : Ruby, Sinatra

## Usage

Deux fichiers ruby sont proposés : fibonnaci.rb calcule les résultats sans interface directement depuis l'url.
gui.rb possède une interface graphique permettant à l'utilisateur d'appeler ses fonctions avec une interface dédiée.

### API

Les requêtes attendues par fibonnaci.rb sont de cette forme : 

http://localhost:4567/[fonction]/[parametre]

La fonction peut être fibo pour un calcul de la suite de Fibonacci classique, 
fibo_inv pour le calcul de l'index de Fibonnaci le plus proche du paramètre, 
fibo_cache pour un calcul stockant ses résultats en cache.

Le paramètre est un entier positif.

### GUI

Connectez vous sur la page http://localhost:4567/index et entrez directement vos requêtes dans les champs prévus à cet effet, puis cliquer sur le bouton pour obtenir un résultat.

## Déploiement docker

Pour déployer l'image via docker, utilisez les commandes suivantes :

make docker 

Cette commande utilise make pour récupérer l'image docker de l'API non graphique.

docker run -p 4567:4567 clguilbert/fibonacciapi 

Celle-ci démarre l'api sur le port 4567

## Déploiment local

make api -> lance l'api non graphique

make gui -> lance l'api graphique
