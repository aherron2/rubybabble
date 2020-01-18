
class TileBag
  def initialize
    @tile_bag = []

    tiles_one_time = [:K, :J, :X, :Q, :Z]
    tiles_two_times = [:B, :C, :M, :P, :F, :H, :V, :W, :Y]
    tiles_three_times = [:G]
    tiles_four_times = [:L, :S, :U, :D]
    tiles_six_times = [:N, :R, :T]
    tiles_eight_times = [:O]
    tiles_nine_times = [:A, :I]
    tiles_twelve_times = [:E]


    tiles_one_time.each do  |tile|
      1.times {@tile_bag << tile}
    end

    tiles_two_times.each do |tile|
      2.times {@tile_bag << tile}
    end

    tiles_three_times.each do |tile|
      3.times {@tile_bag << tile}
    end

    tiles_four_times.each do |tile|
      4.times {@tile_bag << tile }
    end

    tiles_six_times.each do |tile|
      6.times {@tile_bag << tile}
    end

    tiles_eight_times.each do |tile|
      8.times {@tile_bag << tile}
    end

    tiles_nine_times.each do |tile|
      9.times {@tile_bag << tile}
    end

    tiles_twelve_times.each do |tile|
      12.times {@tile_bag << tile}
    end

    def self.points_for(tile)
      {:E => 1, :A => 1, :I => 1, :O => 1, :N => 1, :R => 1, :T => 1, :L => 1, :S => 1, :U => 1,
       :D => 2, :G => 2, :B => 3, :C => 3, :M => 3, :P => 3, :F => 4, :H => 4, :V => 4, :W => 4,
       :Y => 4, :K => 5, :J => 8, :X => 8, :Q => 10, :Z => 10
      }

    end


    def empty?
      @tile_bag.empty?
    end

    def draw_tile
      size1 = @tile_bag.size - 1
      index = rand(size1)
      @tile_bag.delete_at(index)
    end

  end
end
