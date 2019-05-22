class WordChecker
  attr_reader :word_list

  def initialize
    @word_list = create_word_list
  end

  def self.instance
    @instance ||= WordChecker.new
  end

  def find_words(tiles)
    anagramify(tiles).inject([]) do |arr, word|
      word_hash = word.split('').sort.join
      arr << word_list[word_hash]
    end.compact.flatten.uniq
  end

  def create_word_list
    puts "creating word list"
    File.readlines('app/assets/words.txt').inject({}) do |hash, word|
      word_hash = word.chomp.downcase.split('').sort.join
      hash[word_hash] ||= []
      hash[word_hash] << word.chomp
      hash
    end
  end

  def anagramify(word)
    letters = word.downcase.split('')

    (2..letters.count).map do |x|
      letters.combination(x).to_a
    end.flatten(1).uniq.map { |word| word.join('') }
  end
end
