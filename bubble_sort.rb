def sort(array)
    i = 1
    swap = 0

        while i < array.length do
            if array[i] < array[i-1]
                array[i], array[i-1] = array[i-1], array[i]
                swap += 1
            end
            if swap > 0 && i == array.length-1
                i = 0
                swap = 0
            end
            i += 1
        end
    array
end

sort([150,6,3,8,5,8,5,34,3])