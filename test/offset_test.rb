require "./lib/offset"
require 'minitest/autorun'
require 'minitest/pride'


class OffsetTest < Minitest::Test
  def test_class_is_created
    a = Offset.new
    assert_equal Offset, a.class
  end

  def test_generate_a_random_key_lengh_of_5 #will change everyday
    a = Offset.new
    assert_equal "5856" , a.date_number
  end
end
