require 'spellchecker'
require 'tempfile'
require './tile_bag.rb'
require './tile_rack.rb'
require './word.rb'

class Babble

  def initialize
    @tile_bag = TileBag.new
    @tile_rack = TileRack.new
    @total_score = 0
  end

  def run
  input = ""
    until input == :quit.inspect do
      populate_tiles
      puts "Your tiles:"
      puts @tile_rack.hand
      puts "guess a word:"
      input = gets.chomp!
      word_check(input.upcase) unless input == :quit.inspect
      puts "your score"
      puts @total_score
    end
  end

  def populate_tiles
    @tile_rack.number_of_tiles_needed.times do
      @tile_rack.append(@tile_bag.draw_tile)
    end
  end

  def word_check(word_to_check)
    is_valid_word = Spellchecker::check(word_to_check)[0][:correct]
    has_tiles = @tile_rack.has_tiles_for?(word_to_check)

    if is_valid_word && has_tiles
      word_played = Word.new
      word_played = @tile_rack.remove_word(word_to_check)
      word_score = word_played.word
      @total_score += word_score
    elsif is_valid_word
    puts "Not enough tiles"
    else
    puts "Not a valid word"
    end
  end
end
Babble.new.run

