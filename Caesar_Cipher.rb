def cipher(input, shift)
    letters = input.split("")
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    
    letters.map! do |letter| 
        if alphabet.include?(letter)
            if letter == alphabet[-1]
               letter = alphabet[shift+25]
            elsif letter == alphabet[25]
               letter = alphabet[shift-1]
            else
               new_index = alphabet.index(letter)+shift
               letter = alphabet[new_index]
            end
        else
            letter
        end
    end
    letters.join("")
    
    end
        
cipher("Zzloaa!!! hello thErE&%$", 1)