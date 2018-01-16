require_relative 'helpers/math/prime.rb'

module Math

  def self.lcm(numbers)
    product = 1

    Math::Prime.sieve(numbers.max+1).each do |prime|
      while numbers.any?{|e| e % prime == 0}
        product *= prime
        numbers.map!{|e| (e % prime == 0) ? (e / prime) : e}
      end
    end

    product
  end
end

puts Math.lcm (1..10).to_a
puts Math.lcm (1..20).to_a

# require 'benchmark'
# Benchmark.bm do |x|
#   x.report('2 digits'){ puts Math.lcm (1..10).to_a }
#   x.report('3 digits'){ puts Math.lcm (1..20).to_a }
#   x.report('4 digits'){ puts Math.lcm [3, 131, 4, 7] }
# end
