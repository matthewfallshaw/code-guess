ALPHABET = ("a".."z").to_a
cipher_seed = Random.rand(26)
POEM = "There was movement at the station, for the word had passed around
That the colt from old Regret had got away,
And had joined the wild bush horses—he was worth a thousand pound,
So all the cracks had gathered to the fray.
All the tried and noted riders from the stations near and far
Had mustered at the homestead overnight,
For the bushmen love hard riding where the wild bush horses are,
And the stockhorse snuffs the battle with delight.".downcase

def cipher(text, seed)
  out = ""
  text.each_char do |c|
    letter = ALPHABET.index(c)
    if letter
      cipher_letter = letter + seed
      cipher_letter = cipher_letter - 26 if cipher_letter > 25
      out << "#{ALPHABET[cipher_letter]}"
    else
      out << c
    end
  end
  out
end
puts "This is a ciphered poem:"
puts

puts cipher(POEM, cipher_seed)

puts
puts "What do you think is the cipher seed for this cipher?"
guess = gets
puts

if cipher_seed == guess
  puts "You're right!"
else
  puts "The cipher seed was #{cipher_seed}. You were wrong."
  puts
  puts "With your guess the code would have looked like:"
  puts cipher(POEM, guess.to_i)
end
puts
puts "With seed #{cipher_seed} the decoded poem is:"
puts POEM
