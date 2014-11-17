module Enumerable
class Array 
  def my_each
    for i in 0...self.length
        yield(self[i])   
    end
    self
  end
end

[1,2,3].my_each { |num| puts num * 3 }


class Array 
  def my_each_with_index
    for i in 0...self.length
        yield(self[i], self.index(i+1))     
    end
    self
  end
end

[1,2,3].my_each_with_index { |num, idx| puts "#{num} #{idx}" }


class Array 
  def my_select
    new_array = []
    for i in 0...self.length
        new_array << self[i] if yield(self[i])
    end
    new_array
  end
end

[1,2,3,4,5,6,7,8,9,10].my_select { |num| num >= 3 && num <= 7 }


class Array 
  def my_all?
  result = true
    for i in 0...self.length
        result = false if !yield(self[i]) 
    end
    result
  end
end

[1,2,3,4,5,6].my_all? { |num| num == 1 }


class Array 
  def my_any?
  result = false
    for i in 0...self.length
        result = true if yield(self[i]) 
    end
    result
  end
end

[2,2,3,4,1,6].my_any? { |num| num == 7 }


class Array 
  def my_none?
  result = true
    for i in 0...self.length
        result = false if yield(self[i])
    end
    result
  end
end

[2,2,3,4,1,6].my_none? { |num| num == 2 }

class Array 
  def my_count
  count = 0
    for i in 0...self.length
        count += 1 if yield(self[i])
    end
    count
  end
end

[2,2,3,4,1,6].my_count { |num| num == 2 }

class Array 
  def my_map
  new_array = []
    for i in 0...self.size
        new_array << yield(self[i])   
    end
    new_array
  end
end

[2,2,3,4,1,6].my_map { |num| num * 3 }

end