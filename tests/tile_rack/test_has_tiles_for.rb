require './tile_rack.rb'
require "minitest/autorun"


class TileRack::TestHasTilesFor < Minitest::Test

  def setup
    @tile_rack = TileRack.new
  end

  def test_rack_has_needed_letters_when_letters_are_in_order_no_duplicates
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:N)
    assert_equal(true, @tile_rack.has_tiles_for?("BAN"))
  end

  def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:N)
    assert_equal(true, @tile_rack.has_tiles_for?("NAB"))
  end

  def test_rack_doesnt_contain_any_needed_letters
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:N)
    assert_equal(false, @tile_rack.has_tiles_for?("NOT"))
  end

  def test_rack_contains_some_but_not_all_needed_letters
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:N)
    assert_equal(false, @tile_rack.has_tiles_for?("BID"))
  end

  def test_rack_contains_a_word_with_duplicate_letters
    @tile_rack.append(:N)
    @tile_rack.append(:O)
    @tile_rack.append(:O)
    @tile_rack.append(:N)
    assert_equal(true, @tile_rack.has_tiles_for?("NOON"))
  end

  def test_rack_doesnt_contain_enough_duplicate_letters
    @tile_rack.append(:N)
    @tile_rack.append(:O)
    @tile_rack.append(:E)
    @tile_rack.append(:N)
    assert_equal(false, @tile_rack.has_tiles_for?("NOON"))
  end
end

