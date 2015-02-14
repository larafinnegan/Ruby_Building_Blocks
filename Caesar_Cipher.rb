def cipher(input, shift)
    letters = input.split("")
    l_alphabet = ('a'..'z').to_a
    u_alphabet = ('A'..'Z').to_a
	
	shift %= 26 if shift > 26
    
    letters.map! do |letter| 
		if l_alphabet.include?(letter)
			new_index = l_alphabet.index(letter) + shift
			new_index = (26 - new_index).abs if new_index > 25	
			letter = l_alphabet[new_index]
		elsif u_alphabet.include?(letter)
			new_index = u_alphabet.index(letter) + shift
			new_index = (26 - new_index).abs if new_index > 25
			letter = u_alphabet[new_index]
		else
      letter
		end
	end
    letters.join("")
end
        
p cipher("testingaz", 28)