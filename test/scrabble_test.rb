gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_can_score_a_single_letter
    game = Scrabble.new
    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
    assert_equal 15, game.score("yuz")
  end

  def test_it_can_score_an_empty_string
    game = Scrabble.new
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  def test_letter_multiplier_works
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 0, game.score_with_multipliers("")
    assert_equal 0, game.score_with_multipliers(nil)
  end

  # def test_highest_scoring_word
  #   game = Scrabble.new
  #   assert_equal 'home', game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  #   skip
  #   assert_equal 'word', game.highest_scoring_word(['hello', 'word', 'sound'])
  #   assert_equal 'silence', game.highest_scoring_word(['home', 'word', 'silence'])
  #   assert_equal 'word', game.highest_scoring_word(['hi', 'word', 'ward'])
  # end
end
