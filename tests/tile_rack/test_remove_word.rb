require './tile_rack.rb'
require "minitest/autorun"


class TileRack::TestRemoveWord < Minitest::Test

  def setup
    @tile_rack = TileRack.new
  end

  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:N)
    @tile_rack.append(:E)
    @tile_rack.append(:L)
    @tile_rack.remove_word("BAN")
    assert_equal("EL", @tile_rack.hand)
  end

  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:N)
    @tile_rack.append(:E)
    @tile_rack.append(:L)
    @tile_rack.remove_word("LAB")
    assert_equal("NE", @tile_rack.hand)
  end

  def test_can_remove_word_with_duplicate_letters
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:E)
    @tile_rack.append(:L)
    @tile_rack.remove_word("BABE")
    assert_equal("L", @tile_rack.hand)
  end

  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    @tile_rack.append(:B)
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:B)
    @tile_rack.append(:E)
    @tile_rack.append(:L)
    @tile_rack.remove_word("BABE")
    assert_equal("BL", @tile_rack.hand)
  end
end
