require './tile_rack.rb'
require "minitest/autorun"


class TileRack::TestNumberOfTilesNeeded < Minitest::Test

  def setup
    @tile_rack = TileRack.new
    @max_size = 7
  end

  def test_empty_tile_rack_should_need_max_tiles
    assert_equal(@max_size, @tile_rack.number_of_tiles_needed)
  end

  def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
    @tile_rack.append(:A)
    assert_equal(@max_size - 1, @tile_rack.number_of_tiles_needed)
  end

  def test_tile_rack_with_several_tiles_should_need_some_tiles
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:N)
    assert_equal(@max_size - 3, @tile_rack.number_of_tiles_needed)
  end

  def test_that_full_tile_rack_doesnt_need_any_tiles
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:N)
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:N)
    @tile_rack.append(:E)
    assert_equal(0, @tile_rack.number_of_tiles_needed)
  end
end
