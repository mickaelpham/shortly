# Convert a base 10 number (the ID in the database) to base n (`CHARS#size`)
class IdToShortUrl
  CHARS = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten.freeze

  private_class_method :new

  def self.call(id)
    new(id).to_short_url
  end

  def to_short_url
    n         = id
    short_url = ''
    base      = CHARS.size

    loop do
      short_url << CHARS[n % base]
      n /= base

      break unless n.positive?
    end

    short_url.reverse
  end

  private

  attr_reader :id

  def initialize(id)
    @id = id
  end
end
