require 'pry-byebug'
def caesar_cipher(string, key)
  alphabet_array = ('a'..'z').to_a
  punctuation_marks = ['.', ',', '!', '?', ';', ':', '-', '(', ')', '[', ']', '{', '}', '\'', '"', ' ']


  string.split('').reduce('') do |encrypted_string, char|
    if punctuation_marks.include?(char)
      encrypted_string << char
    else
      index = wrap(alphabet_array, char, key)
      if char == char.downcase
        encrypted_string << alphabet_array[index]
      else
        encrypted_string << alphabet_array[index].upcase
      end
    end 
    encrypted_string
  end 
end 

def wrap(array, char, key)
  index = array.index(char.downcase) + key
  if index > 25
    index = index - 25 - 1
  end 
  index
end 

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("protect it", 10)