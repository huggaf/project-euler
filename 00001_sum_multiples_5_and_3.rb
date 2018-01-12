module Math
  def self.sum_multiples of:[3,5], upto:1000
    of = [of].flatten.sort.each_with_object([]) do |n, _ary|
      # check if this number is a multiple from any other number already added
      _ary.push(n) unless _ary.any?{|j| n % j == 0 }
    end

    values = of.map{|e| upto.sum_multiples_of(e) }
    extra = of.combination(2).map{|pair| upto.sum_multiples_of(pair.inject(:*))}

    values.inject(:+).to_i - extra.inject(:+).to_i
  end
end

class Integer
  def sum_multiples_of(n)
    return 0 if n < 1 || n >= self
    m = ((self-1)/n.to_f).floor
    n*(m*(m+1)/2)
  end
end

puts Math.sum_multiples of: [3,5], upto: 10
# => 23
puts Math.sum_multiples of: [3,5], upto:1_000
# => 233168
puts Math.sum_multiples of: [3,5,13], upto:1_000
# => 250731
