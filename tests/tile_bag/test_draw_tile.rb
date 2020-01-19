require './tile_bag.rb'
require "minitest/autorun"

class TileBag::TestDrawTile < Minitest::Test

  def test_has_proper_number_of_tiles
  #tests that exactly 98 tiles can be drawn (after which the bag is empty)
    tile_bag = TileBag.new
    
    assert_equal(false, tile_bag.empty?)
    97.times {tile_bag.draw_tile}
    assert_equal(false, tile_bag.empty?)
    tile_bag.draw_tile
    assert_equal(true, tile_bag.empty?)    
  end
  
  def test_has_proper_tile_distribution
  #tests that the tiles in the bag are distributed exactly as specified in the Scrabble rules.
    expected = {:E => 12, :A => 9, :I => 9, :O => 8, :N => 6, :R => 6, :T => 6, :L => 4, :S => 4, 
    :U => 4, :D => 4, :G => 3, :B => 2, :C => 2, :M => 2, :P => 2, :F => 2, :H => 2, :V => 2, :W => 2,
    :Y => 2, :K => 1, :J => 1, :X => 1, :Q => 1, :Z => 1
    }
    tile_bag = TileBag.new
    actual = {}
    
    expected.each_key do |key|
      actual[key] = 0
    end
    
    assert_equal(false, tile_bag.empty?)
    98.times do 
      tile = tile_bag.draw_tile
      actual[tile] += 1 
    end
    
    expected.each do |key, value|
      assert_equal(value, actual[key])   
    end 
  end
  
end
