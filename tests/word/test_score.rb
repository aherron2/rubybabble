require './word.rb'
require "minitest/autorun"


class Word::TestScore < Minitest::Test

    def test_empty_word_should_have_score_of_zero
        word = Word.new
        assert_equal(0, word.word)
    end

    def test_score_a_one_tile_word
        word = Word.new
        word.append(:A)
        assert_equal(1, word.word)
    end

    def test_score_a_word_with_multiple_different_tiles
        word = Word.new
        word.append(:A)
        word.append(:N)
        word.append(:Y)
        assert_equal(6, word.word)
    end

    def test_score_a_word_with_recurring_tiles
        word = Word.new
        word.append(:E)
        word.append(:Y)
        word.append(:E)
        word.append(:S)
        assert_equal(7, word.word)
    end

end
