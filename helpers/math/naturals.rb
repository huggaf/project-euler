module Math::Naturals
  def self.sum(upto, multiples_of:1)
    return 0 if multiples_of < 1 || multiples_of >= upto
    m = ((upto-1)/multiples_of.to_f).floor
    multiples_of*(m*(m+1)/2)
  end

  def self.sum_square(upto)
    upto*(upto+1)*(2*upto+1)/6
  end
end
