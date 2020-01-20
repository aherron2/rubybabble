class TileGroup

  attr_accessor :tiles

  def initialize
    @tiles = []
  end

  def append(tile)
    @tiles << tile unless tile.nil?
  end

  def remove(tile)
    result = @tiles.index(tile)
    @tiles.delete_at(result)
  end

  def hand
    @tiles.join
  end
 
  def empty?
    @tiles.empty?
  end
end
