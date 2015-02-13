def substring(input, dictionary)
  output = Hash.new(0)

  input.downcase.split(" ").each do |x|
    dictionary.each {|word| output[word] += 1 if x.include?(word)}
  end
  output
end

dictionary = ["below","down","go","going","horn",\
"how","howdy","it","i","low","own","part","partner","sit"]

p substring("Howdy partner, sit down! How's it going?", dictionary)