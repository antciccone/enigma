require_relative 'offset'
require_relative 'key'
require 'pry'

class Encipher
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
  end

  def key_strings
  key = @key
  key_values  = key.chars
  end

  def offset_to_array
  off_set = @offset
  off_set_value = off_set.chars
  end

  def set_rotations(keys, offset)
    keys_a = keys.to_s.chars.map(&:to_i)
    offset_a = offset.to_s.chars.map(&:to_i)

  @a = keys_a[0..1].join.to_i + offset_a[0].to_i
  @b = keys_a[1..2].join.to_i + offset_a[1].to_i
  @c = keys_a[2..3].join.to_i + offset_a[2].to_i
  @d = keys_a[3..4].join.to_i + offset_a[3].to_i
  return a
  end

  def encrypt_letter(letter, rotation)
    mutated_characters = characters.rotate(rotation)
    dictionary = Hash[@characters.zip(mutated_characters)]
    dictionary[letter]
  end

  def encrypt(message)
  encrypted_output = message.chars.map.with_index do |char, index|
    if index % 4 == 0
      rotation = a
    elsif index % 4 == 1
      rotation = b
    elsif index % 4 == 2
      rotation = c
    else
      rotation = d
    end
  encrypt_letter(char, rotation)
    end
  encrypted_output.join
  end
end
