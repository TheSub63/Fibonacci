#!/usr/bin/env ruby
require 'sinatra'

set :environment, :production

$phi = 0.61803398874989484820
$cache = [0,1]

get '/' do
  "Fibonacci : entrez '/fibo/votre_nombre'"
end

get '/fibo/:num' do
  n = params['num'].to_i
  if n >= 0
      get_n_fibonacci_numbers(n+1)[-1].to_s
  else
    status 400
  end
end

get '/fibo_inv/:num' do
  if params['num'].to_i >= 0
    get_n_fibonacci_numbers_inv(params['num'].to_i).round.to_s
  else
    status 400
  end
end

get '/fibo_cache/:num' do
  #Initialization des variables
  n = params['num'].to_i
  res = ""
  #Verification de l'argument
  if n >= 0
    #Construction incrémentale du cache pour éviter la Stack Too Deep Exception
    if n > $cache.length + 1000
      while n > $cache.length + 1000
        memoize($cache.length + 1000)
      end
      res = memoize(n).to_s
    else
      res = memoize(n).to_s
    end
  else
    status 400
  end
  return res
end

private
def get_n_fibonacci_numbers(num)
  case num
  when 0
    return []
  when 1
    return [0]
  else
    #Version non récursive avec décalage
    (1..num-2).inject([0,1]) do |result, n|
      result << (result[n - 1] + result[n])
    end
  end
end

def get_n_fibonacci_numbers_inv(num)
  #Calcul de l'index de fibonnaci
  -(Math::log10(num)+(Math::log10(5)/2))/Math::log10($phi)
end

def memoize(fib)
  #Recupération dans le cache
  if $cache[fib]
    $cache[fib]
  else
    if fib < 2
      return fib
    else
      #Appel récursif
      $cache[fib] = memoize(fib - 1) + memoize(fib - 2)
    end
  end
end