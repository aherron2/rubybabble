require './tile_group.rb'
require "minitest/autorun"


class TileGroup::TestInitialize < Minitest::Test
  def test_create_empty_tile_group
    tile_group = TileGroup.new
    assert_equal(true, tile_group.empty?)
  end
end
