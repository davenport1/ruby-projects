#Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string

def caesar_cipher(original_string, shift_factor) 


    alphabet = ('a'..'z').to_a         #string holding all lower case letters in alphabet
    upcase_alphabet = ('A'..'Z').to_a  #string holding all uppercase letters in alphabet
    caesar = ""                        #string to return with modified shift factor                 

    original_string.each_char do |c|   #shift each character by shift factor. if space, append space to return string
        if c == " "
            caesar += " "
        else
            if c == c.upcase #current character is upper case
                index = (upcase_alphabet.find_index(c) + shift_factor) % upcase_alphabet.count
                caesar += upcase_alphabet[index]
            else             #current character is lower case
                index = (alphabet.find_index(c) + shift_factor) % alphabet.count
                caesar += alphabet[index]
            end
        end
    end
    return caesar

end


message = 'cat'
expected_result = 'fdw'
altered = caesar_cipher(message, 3)
puts altered
puts expected_result

#trying uppercase
message2 = 'CAT'
expected_result2 = 'FDW'
altered2 = caesar_cipher(message2, 3)
puts altered2 
puts expected_result2

#testing wraparound
message3 = 'xyz'
message4 = 'XYZ'
expected_result3 = 'abc'
expected_result4 = 'ABC'
altered3 = caesar_cipher(message3, 3)
altered4 = caesar_cipher(message4, 3)
puts altered3
puts altered4
