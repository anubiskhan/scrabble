require 'pry'

class Scrabble

  def score(word)
    if word == "" || word == nil
      points = 0
    else
      word_array = word.upcase.chars
      points = 0
      word_array.map! do |char|
        char = point_values[char]
      end
      word_array.each do |number|
        points += number
      end
    end
    points
  end

  def score_with_multipliers(word, multiplier_index = [], word_multiplier = 1, word_length = 0)
    #protects against "" and nil messing up method
    if word == "" || word == nil
      points = 0
    else
      #variable to for later use 'is word 7 letters or longer'
      word_length = word.size
      #creates array of capital letters to check against scoring hash
      word_array = word.upcase.chars
      #set default point vale so it can be passed out of .each loop
      points = 0
      #remaps array of word characters with corresponding scores from hash
      word_array.map! do |char|
        #assigns a variable in the map loop by shifting the number from the
        #multiplier_index array, the 2nd argument passed into this method
        multiplier = multiplier_index.shift
        #multiplies the character score from score has by the number pulled from multiplier_index
        char = point_values[char]*multiplier
      end
      #sums the word_array, at this point the word_array has been converted
      #from letters ['a', 'b', etc] into [1, 3, etc] and * by multiplier_index
      #[1*1, 3*2, etc*1]
      word_array.each do |number|
        points += number
      end
    end
    #checks to see if additional points should be added for word length
    if word_length > 6
      points += 10
    end
    #multiplies word by multiplier, passed in as 3rd argument or default to 1
    points*word_multiplier
  end

  # def highest_scoring_word(words = [])
  #   best_word = ''
  #   word_and_score = []
  #   words.each do |word|
  #     word_and_score.push({word: word, score: score(word)})
  #   end
  #   word_and_score = word_and_score.sort_by { |hash| hash[:weight] }
  #   finalists = [word_and_score.shift]
  #   word_and_score.each do |hash|
  #     if hash[:score] == finalists[:score]
  #       finalists.push(hash)
  #     end
  #   end
  #     finalists.sort_by { |hash| hash[:word.length]}
  #   best_word = finalists.shift[:word]
  # end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end


end
