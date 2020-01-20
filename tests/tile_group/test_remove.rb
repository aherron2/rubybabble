require './tile_group.rb'
require "minitest/autorun"


class TileGroup::TestRemove < Minitest::Test

  def setup
    @tile_group = TileGroup.new
  end

  def test_remove_only_tile  
    @tile_group.append(:A)
    assert_equal(1, @tile_group.tiles.size)
    @tile_group.remove(:A)
    assert_equal(0, @tile_group.tiles.size)
  end

  def test_remove_first_tile_from_many
    @tile_group.append(:A)
    @tile_group.append(:E)
    @tile_group.append(:I)
    @tile_group.append(:O)
    @tile_group.append(:U)
    assert_equal(5, @tile_group.tiles.size)
    @tile_group.remove(:A)
    assert_equal(4, @tile_group.tiles.size)
    assert_equal(:E, @tile_group.tiles.fetch(0))
    
  end

  def test_remove_last_tile_from_many
    @tile_group.append(:A)
    @tile_group.append(:E)
    @tile_group.append(:I)
    @tile_group.append(:O)
    @tile_group.append(:U)
    assert_equal(5, @tile_group.tiles.size)
    @tile_group.remove(:U)
    assert_equal(4, @tile_group.tiles.size)
    assert_equal(:O, @tile_group.tiles.last)
  end

  def test_remove_middle_tile_from_many
    @tile_group.append(:A)
    @tile_group.append(:E)
    @tile_group.append(:I)
    @tile_group.append(:O)
    @tile_group.append(:U)
    assert_equal(5, @tile_group.tiles.size)
    @tile_group.remove(:I)
    assert_equal(4, @tile_group.tiles.size)
    assert_equal(:O, @tile_group.tiles.fetch(2))
  end

  def test_remove_multiple_tiles
    @tile_group.append(:A)
    @tile_group.append(:E)
    @tile_group.append(:I)
    @tile_group.append(:O)
    @tile_group.append(:U)
    assert_equal(5, @tile_group.tiles.size)
    @tile_group.remove(:A)
    @tile_group.remove(:I)
    @tile_group.remove(:U)
    assert_equal(2, @tile_group.tiles.size)
    assert_equal(:E, @tile_group.tiles.first)
    assert_equal(:O, @tile_group.tiles.last)
  end

  def test_make_sure_duplicates_are_not_removed
    @tile_group.append(:A)
    @tile_group.append(:A)
    @tile_group.append(:I)
    @tile_group.append(:O)
    @tile_group.append(:U)
    assert_equal(5, @tile_group.tiles.size)
    @tile_group.remove(:A)
    assert_equal(4, @tile_group.tiles.size)
    assert_equal(:A, @tile_group.tiles.first)
  end
end
