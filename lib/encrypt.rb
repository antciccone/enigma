require 'pry'
handle = File.read(ARGV[0]).chomp

e = Enigma.new
encrypted_string = e.encrypt(handle)

File.write(ARGV[1], encrypted_string)
