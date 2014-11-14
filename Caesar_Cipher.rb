def cipher(input, shift)
    letters = input.split("")
    l_alphabet = ('a'..'z').to_a
    u_alphabet = ('A'..'Z').to_a
    
    letters.map! do |letter| 
      if l_alphabet.include?(letter)
        new_index = l_alphabet.index(letter) + shift
          if new_index > 25
            new_index = (26 - new_index).abs
          end
        letter = l_alphabet[new_index]
      elsif u_alphabet.include?(letter)
        new_index = u_alphabet.index(letter) + shift
          if new_index > 25
            new_index = (26 - new_index).abs
          end
        letter = u_alphabet[new_index]
      else
        letter
      end
    end
    letters.join("")
end
        
cipher("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ .,!", -4)