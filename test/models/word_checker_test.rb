require 'test_helper'

class WordCheckerTest < Minitest::Test
  attr_reader :wc

  def setup
    @wc = WordChecker.instance
  end

  def test_it_creates_a_wordlist_on_init
    assert_instance_of Hash, wc.word_list
    assert_equal ["ahs", "ash", "has", "sha"], wc.word_list["ahs"]
  end

  def test_it_can_create_an_anagram_of_a_group_of_letters
    result = ["ah", "as", "hs", "ahs"]

    assert_equal result, wc.anagramify("ahs")
    assert_equal wc.anagramify("aabbccc").uniq, wc.anagramify("aabbccc")
  end

  def test_it_finds_legit_words_from_a_list_of_letters
    result = ["ah", "ha", "as", "sh", "ahs", "ash", "has", "sha"]
    word_list = wc.find_words("ahs")

    assert_equal result, word_list
    refute word_list.include?("sah")
  end
end
