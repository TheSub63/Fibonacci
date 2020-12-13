#!/usr/bin/env ruby
require 'sinatra'

set :environment, :production

$cache = [0,1]
get '/' do
  "To use this fibonacci number generator please hit /seed_number"
end

get '/:num' do
  n = params['num'].to_i
  res = ""
  if n >= 0
    if n > $cache.length + 1000
      $cache.each do |num|
        puts num
      end
    while n > $cache.length + 1000
      memoize($cache.length + 1000)
    end
      res = memoize(n).to_s
    else
      $cache.each do |num|
        puts num
      end
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
    (1..num-2).inject([0,1]) do |result, n|
      result << (result[n - 1] + result[n])
    end
  end
end
def memoize(fib)
    if $cache[fib]
      $cache[fib]
    else
      if fib < 2
        return fib
        else
          $cache[fib] = memoize(fib - 1) + memoize(fib - 2)
      end
    end

end

