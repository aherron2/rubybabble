require './tile_group.rb'
require "minitest/autorun"


class TileGroup::TestAppend < Minitest::Test
  def test_append_one_tile
    tile_group = TileGroup.new
    tile_group.append(:A)
    assert_equal(1, tile_group.tiles.size)
    assert_equal(:A, tile_group.tiles.fetch(0))
  end
  
  def test_append_many_tiles
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:E)
    tile_group.append(:I)
    assert_equal(3, tile_group.tiles.size)
    assert_equal(:A, tile_group.tiles.fetch(0))
    assert_equal(:E, tile_group.tiles.fetch(1))
    assert_equal(:I, tile_group.tiles.fetch(2))
  end
  
  def test_append_duplicate_tiles
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:A)
    tile_group.append(:A)
    assert_equal(3, tile_group.tiles.size)
    assert_equal(:A, tile_group.tiles.fetch(0))
    assert_equal(:A, tile_group.tiles.fetch(1))
    assert_equal(:A, tile_group.tiles.fetch(2))
  end
end
