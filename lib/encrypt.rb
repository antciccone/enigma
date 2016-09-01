require './lib/encipher'

read_from = ARGV[0]
encrypt_to = ARGV[1]

input = File.read(read_from)

e = Encipher.new

encrypted_text = e.encrypt(input)

output = File.write(encrypt_to, encrypted_text)
