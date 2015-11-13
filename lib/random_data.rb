
module RandomData

  def random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end
    if rand(1..10) > 9
      sentences.each do |sentence|
        sentence.upcase!
      end
    end
    sentences.join(" ")
  end

  def random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << punctuate
  end

  def random_question
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "?"
  end

  def random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end

  def punctuate
    punctuations = ['.', '!', '?']
    punctuations[rand(0..(punctuations.length-1))]
  end
end
