require_relative 'offset'
require_relative 'key'
require_relative 'encipher'

class Decrypting
  attr_reader :key,
              :key_and_offset_value,
              :a,
              :b,
              :c,
              :d,
              :characters,
              :offset
  def initialize
  @key    =  Key.new.random_key
  @offset = Offset.new.date_number
  @characters = (' '..'z').to_a
  @rotation = []
  end
  def set_rotations(keys, offset)
    keys_a = keys.to_s.chars.map(&:to_i)
    offset_a = offset.to_s.chars.map(&:to_i)

  @a = keys_a[0..1].join.to_i + offset_a[0].to_i
  @b = keys_a[1..2].join.to_i + offset_a[1].to_i
  @c = keys_a[2..3].join.to_i + offset_a[2].to_i
  @d = keys_a[3..4].join.to_i + offset_a[3].to_i
  return b
  end

  def decrypting_letter(letter, rotation)
    mutated_characters = characters.rotate(rotation)
    dictionary = Hash[@characters.zip(mutated_characters)]
    dictionary.key(letter)
  end

  def decrypt(message)
    decrypt_output = message.chars.map.with_index do |char, index|
    if index % 4 == 0
      rotation = a
    elsif index % 4 == 1
      rotation = b
    elsif index % 4 == 2
      rotation = c
    else
      rotation = d
    end
    decrypting_letter(char, rotation)
    end
    decrypt_output.join
  end
end
