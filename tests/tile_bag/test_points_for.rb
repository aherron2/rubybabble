require './tile_bag.rb'
require "minitest/autorun"

class TileBag::TestPointsFor < Minitest::Test

    def test_confirm_point_values

      tiles_one_points = [:E, :A, :I, :O, :N, :R, :T, :L, :S, :U]
      tiles_two_points = [:D, :G]
      tiles_three_points = [:B, :C, :M, :P]
      tiles_four_points = [:F, :H, :V, :W, :Y]
      tiles_five_points = [:K]
      tiles_eight_points = [:J, :K]
      tiles_ten_points = [:Q, :Z]

      
      tiles_one_points.each do |tile|
        assert_equal 1, TileBag.points_for(tile)
      end

      #tiles_two_points.each do |tile|
      #  assert_equals(2, TileBag.points_for(tile))
      #end
      #
      #tiles_three_points.each do |tile|
      #  assert_equals(3, TileBag.points_for(tile))
      #end
      #
      #tiles_four_points.each do |tile|
      #  assert_equals(4, TileBag.points_for(tile))
      #end
      #
      #tiles_five_points.each do |tile|
      #  assert_equals(5, TileBag.points_for(tile))
      #end
      #
      #tiles_eight_points.each do |tile|
      #  assert_equals(8, TileBag.points_for(tile))
      #end
      #
      #tiles_ten_points.each do |tile|
      #  assert_equals(10, TileBag.points_for(tile))
      #end
    end
end
