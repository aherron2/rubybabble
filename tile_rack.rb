class TileRack < TileGroup

  def number_of_tiles_needed
    max = 7
    max - @tiles.size
  end

  def has_tiles_for?(text)
    temp_array = @tiles.hand.split("")
    text_array = text.split("")
    text_array.each do |tile|
      index = temp_array.find_index(tile)
      return false if index.nil?
      temp_array.delete_at(index)
    end
    true
  end

  def remove_word(text)
    text_array = text.split("")
    word = Word.new
    text_array.each do |tile|
      word.append(tile.to_sym)
      @tiles.delete_at(find_index(tile))
    end
    word
  end
end
