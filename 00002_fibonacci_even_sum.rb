module Math
  # plain modulo checking
  def self.fibo upto:4_000_000
    a, b, sum = 1,1,0
    while b < upto
      a, b = b, a + b
      sum += b if b % 2 == 0
    end

    sum
  end

  # getting the next 2 odd numbers to sum
  # 1+1=2, 3+5=8, 13+21=34
  def self.fibo2 upto:4_000_000
    a, b, sum = 1,1,0
    while b < upto
      sum += a + b
      a, b = a + 2*b, 2*a + 3*b
    end

    sum
  end
end


require 'benchmark'
n = 10_000

Benchmark.bm do |x|
  x.report{ n.times{Math.fibo} }
  x.report{ n.times{Math.fibo2} }
end
