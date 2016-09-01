require "./lib/crack"
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CrackTest < Minitest::Test
  def  test_that_we_can_out_end
  e = Crack.new

  assert_equal "this is so secret ..end..", e.crack("hey tehre mate")
  end
end
