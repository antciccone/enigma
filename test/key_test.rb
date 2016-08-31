require 'simplecov'
SimpleCov.start
require "./lib/key"
require 'minitest/autorun'
require 'minitest/pride'


class KeyTest < Minitest::Test
  def test_class_is_created
    a = Key.new
    assert_equal Key, a.class
  end

  def test_generate_a_random_key_lengh_of_5
    a = Key.new
    assert_equal 5,  a.random_key.length
  end
end
