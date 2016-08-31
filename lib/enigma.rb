require_relative 'encipher'
require_relative 'decrypting'
require_relative 'crack'

class Enigma
  attr_reader :encipher
  def initialize
    @encipher = Encipher.new
  end
end
