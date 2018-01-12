module Math
  def self.max_prime(limit)
    idx, factors, _primes = -1, [], sieve(Math.sqrt(limit).ceil)

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

  # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  def self.sieve(limit)
    i, _ary = 2, Array.new(limit,true)

    _ary[0], _ary[1] = false, false

    while i*i <= limit
      if _ary[i]
        j = i*i
        while j <= limit
          _ary[j] = false
          j += i
        end
      end

      i += 1
    end

    (2..limit).select{|i| _ary[i]}
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
