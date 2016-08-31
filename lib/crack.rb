require_relative 'decrypting'
require 'pry'


class Crack
  attr_reader :message, :date
  def initialize
    @e = Decrypting.new
    @message = message
    @date = date
  end

  def crack(message)
    99999.times do |i|
      @e.decrypt(message)
      return i if e[-7..-1] == "..end.."

    end
  end
end
