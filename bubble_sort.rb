def sort(array)
    swap = true
    while swap
        swap = false
        for i in 1...array.length do
            if array[i] < array[i-1]
                array[i], array[i-1] = array[i-1], array[i]
                swap = true
            end
        end
    end
    array
end

sort([150,6,3,8,5,8,5,34,3])