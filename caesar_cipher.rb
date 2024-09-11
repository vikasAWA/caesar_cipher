require 'pry-byebug'
def caesar_cipher(string, key)
  alphabet_array = ('a'..'z').to_a

  string.split('').reduce('') do |encrypted_string, char|
    if alphabet_array.include?(char.downcase)
      index = wrap(alphabet_array, char, key)
      encrypted_string << (char == char.downcase ? alphabet_array[index] : alphabet_array[index].upcase)
    else
      encrypted_string << char
    end 
    encrypted_string
  end 
end 

def wrap(array, char, key)
  index = array.index(char.downcase) + key
  if index > 25
    index = index % 26
  end 
  index
end 

puts caesar_cipher("What a string!", 5)
