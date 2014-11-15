def substring(input, dictionary)
    words = input.downcase.split(" ")
    output=Hash.new(0)

    words.each do |x|
        dictionary.each do |word|
            if x.include?(word)
                output[word] += 1
            end
        end
    end
    output
end


substring("Howdy partner, sit down! How's it going?",\
["below","down","go","going","horn",\
"how","howdy","it","i","low","own","part","partner","sit"])