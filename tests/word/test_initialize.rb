require './word.rb'
require "minitest/autorun"

class Word::TestInitialize < Minitest::Test
  def test_create_empty_word
    word = Word.new
    assert_equal(true, word.empty?)
  end
end
