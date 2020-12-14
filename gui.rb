#!/usr/bin/env ruby
require 'sinatra'

set :environment, :production

$phi = 0.61803398874989484820
$cache = [0,1]

get '/' do
  "Fibonacci : entrez '/fibo/votre_nombre'"
end

get '/test' do
  if params.has_key?('fibo')
    n = params[:fibo].to_i
    if n >= 0
      @res = get_n_fibonacci_numbers(n+1)[-1].to_s
    else
      status 400
    end
  elsif params.has_key?('fibo_inv')
    n = params[:fibo_inv].to_i
    if n >= 0
      @res = get_n_fibonacci_numbers_inv(n).round.to_s
    else
      status 400
    end
  elsif params.has_key?('fibo_cache')
    n = params[:fibo_cache].to_i
    if n >= 0
      if n > $cache.length + 1000
        while n > $cache.length + 1000
          memoize($cache.length + 1000)
        end
        @res = memoize(n).to_s
      else
        @res = memoize(n).to_s
      end
    else
      status 400
    end
  end

  erb(:index) # Sinatra will now render the 'app/views/homepage.erb' file when a user visits 'yoursite.com/'
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
