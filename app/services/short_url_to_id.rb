class ShortUrlToId
  UPPERCASE_STARTS_AT = 'A'.ord + ('a'..'z').to_a.size
  NUMBER_STARTS_AT    = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten.size

  private_class_method :new

  def self.call(short_url)
    new(short_url).to_id
  end

  def to_id
    size = IdToShortUrl::CHARS.size

    short_url.reverse.chars.map.with_index do |char, index|
      num = if ('a'..'z').cover?(char)
              char.ord - 'a'.ord
            elsif ('A'..'Z').cover?(char)
              char.ord - UPPERCASE_STARTS_AT
            elsif ('0'..'9').cover?(char)
              char.to_i + NUMBER_STARTS_AT
            else
              0
            end

      num * size**index
    end.reduce(:+)
  end

  private

  attr_reader :short_url

  def initialize(short_url)
    @short_url = short_url
  end
end
