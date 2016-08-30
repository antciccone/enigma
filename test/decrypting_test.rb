require "./lib/decrypting"
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class DecryptingTest < Minitest::Test
  def test_to_see_created_class
    a = Decrypting.new

    assert_equal Decrypting, a.class
  end

  def test_adding_key_values_to_offset_Values
    enigma = Decrypting.new


    assert_equal 32, enigma.set_rotations(12765, 5565)
  end

  def test_decrypt_letter_one_letter
    enigma = Decrypting.new

      assert_equal "a" , enigma.decrypting_letter("b", 1)
    assert_equal "a" , enigma.decrypting_letter("h", 7)
  end


  def  test_interating_over_one_character
      message = Decrypting.new
      message.set_rotations(12765, 5658)

      assert_equal "a", message.decrypt("r")
      assert_equal "Anthony and Eric", message.decrypt("R4jV%4oir4ZiV8_Q")
    end
end
