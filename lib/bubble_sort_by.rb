def bubble_sort_by(array)
	swap = true
    
    while swap do
        swap = false
        for i in 1...array.length
            if yield(array[i], array[i-1]) < 0
                array[i], array[i-1] = array[i-1], array[i]
                swap = true
            end
        end
    end
    puts array
end
    
    
bubble_sort_by(["loooooong", "s", "sh", "shh", "shortish"]) {|second, first| 
second.length - first.length}