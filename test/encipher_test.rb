require 'simplecov'
SimpleCov.start
require './lib/encipher'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class EncipherTest < Minitest::Test
  def test_to_see_created_class
    a = Encipher.new

    assert_equal Encipher, a.class
  end

  def test_the_length_of_generated_key
    a = Encipher.new
    
    assert_equal 5, a.key.length
  end

  def test_off_set_values
    a = Encipher.new

    assert_equal "5856", a.offset
  end

  def test_key_strings_are_an_array_of_strings
    a = Encipher.new
    a.key_strings

    assert_equal Array, a.key_strings.class
  end

  def test_off_set_values_are_an_array_of_strings
    a = Encipher.new
    a.offset_to_array

    assert_equal Array, a.offset_to_array.class
  end

  def test_assign_varibles_to_key_value
    a = Encipher.new
    a.key_strings
    a.set_rotations(12765, 5658)

    assert_equal Fixnum, a.set_rotations(12765, 5658).class
  end

  def test_adding_key_values_to_offset_Values
    enigma = Encipher.new


    assert_equal 17, enigma.set_rotations(12765, 5565)
  end

  def test_encrypt_with_blank_string
    enigma = Encipher.new

    assert_equal nil, enigma.encrypt_letter("", 10)
  end

  def test_encrypt_one_letter
    enigma = Encipher.new

    assert_equal "b" , enigma.encrypt_letter("a", 1)
    assert_equal "h" , enigma.encrypt_letter("a", 7)
  end

  def test_interating_over_one_character
    message = Encipher.new
    message.set_rotations(12765, 5658)

    assert_equal "r", message.encrypt("a")
  end

  def test_interating_over_two_characters
    message = Encipher.new
    message.set_rotations(12765, 5658)

    assert_equal "r4", message.encrypt("an")
  end

  def test_interating_over_three_characters
    message = Encipher.new
    message.set_rotations(12765, 5658)

    assert_equal "r4j", message.encrypt("ant")
  end

  def test_beyond_four_letter_words
    message = Encipher.new
    message.set_rotations(12765, 5658)

    assert_equal "r4jV%4o", message.encrypt("anthony")
  end

  def test_with_spaces_and_special_characters
    message = Encipher.new
    message.set_rotations(12765, 5658)

    assert_equal "R4jV%4oir4ZiV8_Q" , message.encrypt("Anthony and Eric")
  end
end
