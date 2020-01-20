class Word < TileGroup

  def initialize
    super
  end

  def word
    points = 0
    self.tiles.each do |tile|
      points += TileBag.points_for(tile)
    end
    points
  end
end
