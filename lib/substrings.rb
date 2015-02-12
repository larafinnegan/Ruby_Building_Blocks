def substring(input, dictionary)
    output=Hash.new(0)

    input.downcase.split(" ").each do |x|
        dictionary.each do |word|
            if x.include?(word)
                output[word] += 1
            end
        end
    end
    output
end

dictionary = ["below","down","go","going","horn",\
"how","howdy","it","i","low","own","part","partner","sit"]

substring("Howdy partner, sit down! How's it going?", dictionary)