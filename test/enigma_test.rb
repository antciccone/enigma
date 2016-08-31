require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class EnigmaTest < Minitest::Test

  def test_initializing_encipher_class
   a = Enigma.new
   assert_equal "903482"
 end
end
