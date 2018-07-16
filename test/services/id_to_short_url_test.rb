require 'test_helper'

class IdToShortUrlTest < ActiveSupport::TestCase
  def test_short_url_with_one_character
    assert_equal 'a', IdToShortUrl.call(0)
  end

  def test_short_url_with_two_characters
    assert_equal 'ba', IdToShortUrl.call(IdToShortUrl::CHARS.size)
  end

  def test_short_url_with_large_id
    assert_equal 'emjc', IdToShortUrl.call(1_000_000)
  end
end
