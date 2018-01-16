require_relative 'helpers/math/primes.rb'

module Math
  def self.max_prime(limit)
    idx, factors, _primes = -1, [], Math::Prime.sieve(Math.sqrt(limit).ceil)

    while idx < _primes.length-1 do
      idx += 1
      n = _primes[idx]

      if limit % n == 0
        idx -= 1
        limit /= n
        factors.push n
      end
    end

    factors.max
  end

end

puts Math.max_prime(30)
puts Math.max_prime(13195)
puts Math.max_prime(600851475143)

# require 'benchmark'
# n = 10_000
#
# Benchmark.bm do |x|
#   x.report{ n.times{Math.fibo} }
#   x.report{ n.times{Math.fibo2} }
# end
