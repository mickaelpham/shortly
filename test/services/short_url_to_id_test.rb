require 'test_helper'

class ShortUrlToIdTest < ActiveSupport::TestCase
  def test_with_one_character
    assert_equal 0, ShortUrlToId.call('a')
  end

  def test_with_two_characters
    assert_equal IdToShortUrl::CHARS.size, ShortUrlToId.call('ba')
  end

  def test_with_multiple_characters
    assert_equal 1_000_000, ShortUrlToId.call('emjc')
  end
end
