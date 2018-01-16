module Math::Prime
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
