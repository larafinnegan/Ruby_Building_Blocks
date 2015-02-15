module Enumerable

  def my_each
    return enum_for(:my_each) unless block_given?
    for i in 0...self.size
      yield(self[i])
    end
    self
  end


  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    for i in 0...self.size
      yield(self[i], i)     
    end
    self
  end


  def my_select
    return to_enum(:my_select) unless block_given?
    new_array = []
    for i in 0...self.size
      new_array << self[i] if yield(self[i])
    end
    new_array
  end


  def my_all?
    if block_given?
      for i in 0...self.size
        return false unless yield(self[i]) 
      end
      true
    else
      for i in 0...self.size
        return false unless self[i]
      end
      true
    end
  end


  def my_any?
    if block_given?
      for i in 0...self.size
        return true if yield(self[i]) 
      end
      false
    else
      for i in 0...self.size
        return true if self[i] 
      end
      false
    end
  end


  def my_none?
    if block_given?
      for i in 0...self.size
        return false if yield(self[i])
      end
      true
    else
      for i in 0...self.size
        return false if self[i]
      end
      true
    end
  end


  def my_count(*arg)
    return self.size unless block_given? || arg != []
    count = 0
    if block_given?
      for i in 0...self.size
        count += 1 if yield(self[i])
      end
    else
      for i in 0...self.size
        count += 1 if arg[0] == self[i]
      end
    end
    count
  end


  def my_map
    return to_enum(:my_map) unless block_given?
    new_array = []
    for i in 0...self.size
      new_array << yield(self[i])   
    end
    new_array
  end


  def my_inject(accum = self[0])
    self.unshift(self[0]) unless accum == self[0]
    for i in 0...self.size
      accum = yield(accum, self[i])   
    end
    accum
  end


  def multiply_els
    self.my_inject { |result, element| result * element }
  end


  def my_map(&map_proc)
    new_array = []
    for i in 0...self.size
      new_array << map_proc.call(self[i])
    end
    new_array
  end

end


#[1,2,3].my_each { |num| puts num * 3 }
#[1,2,3].my_each_with_index { |num, idx| puts "#{num} #{idx}" }
#[1,2,3,4,5,6,7,8,9,10].my_select { |num| num >= 3 && num <= 7 }
#[1,2,3,4,5,6].my_all? { |num| num == 1 }
#[2,2,3,4,1,6].my_any? { |num| num == 7 }
#[2,2,3,4,1,6].my_none? { |num| num == 2 }
#[2,2,3,4,1,6].my_count(2)
#[2,2,3,4,1,6].my_map { |num| num * 3 }
#[4,2,1,3].my_inject { |result, element| result + element }
#[2,4,5].multiply_els
#map_proc = Proc.new { |num| num * 3 }
#[1,2,3].my_map(&map_proc)

