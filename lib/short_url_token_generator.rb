class ShortUrlTokenGenerator
  # Mapping of string to use for generate tokens
  @mapping = :oJC8RZuYg2pTrAIkjWHN1nxQ3c4yVKP5X9LBbaisDdfqv6heU7zGFSOlEw0mMt
  
  # Get mapping
  def self.mapping
    @mapping.to_s.split //
  end
  
  # Generate token (using alpha-numeric mapping)
  # Param: num (index of the URL)
  def self.generate num
    token = ""
    base_notation(num).split('-').each { |position| token += "#{mapping[position.to_i]}" }
    token
  end
  
  # Decode token (for correct decoding, the token must be generated using this class)
  # Param: token
  def self.decode token
    return -1 if token.length > 15
    num = i = 0
    token.chars.to_a.reverse_each do |t|
      num += mapping.index(t) * mapping.length**i unless mapping.index(t).nil?
      i += 1
    end
    num
  end
  
  # Calculate base notation
  def self.base_notation num, base = nil
    base = mapping.length if base.nil?
    num < base ? "#{num}" : "#{base_notation (num/base).floor, base}-#{num % base}"
  end
end