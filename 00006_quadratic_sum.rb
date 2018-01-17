require_relative 'helpers/math/naturals.rb'

module Math

  def self.square_difference(upto=10)
    (Math::Naturals.sum(upto)**2) - Math::Naturals.sum_square(upto)
  end
end

puts Math.square_difference 10
# require 'benchmark'
# Benchmark.bm do |x|
#   x.report('2 digits'){ puts Math.lcm (1..10).to_a }
#   x.report('3 digits'){ puts Math.lcm (1..20).to_a }
#   x.report('4 digits'){ puts Math.lcm [3, 131, 4, 7] }
# end
