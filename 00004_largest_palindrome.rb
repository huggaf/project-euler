module Math
  def self.largest_palindrome(pow:2)
    min, max, found = 10**(pow-1), (10**pow)-1, 0
    a = b = max

    begin
      product = a * b
      found = product if product > found && product.palindrome?

      if b > min && product > found
        b -= 1
      else
        a, b = a-1, max
        break if a * b <= found
      end
    end while a > min

    found
  end
end

class Integer
  def palindrome?
    (str = self.to_s) == str.reverse
  end
end

puts Math.largest_palindrome pow: 2
puts Math.largest_palindrome pow: 3
puts Math.largest_palindrome pow: 4
puts Math.largest_palindrome pow: 5
puts Math.largest_palindrome pow: 6

# require 'benchmark'
# Benchmark.bm do |x|
#   x.report('2 digits'){ Math.largest_palindrome pow: 2 }
#   x.report('3 digits'){ Math.largest_palindrome pow: 3 }
#   x.report('4 digits'){ Math.largest_palindrome pow: 4 }
#   x.report('5 digits'){ Math.largest_palindrome pow: 5 }
#   x.report('6 digits'){ Math.largest_palindrome pow: 6 }
# end
