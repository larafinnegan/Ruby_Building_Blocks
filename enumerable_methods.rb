module Enumerable

	class Array 
		
		def my_each
			for i in 0...self.length
				yield(self[i])   
			end
			self
		end


		def my_each_with_index
			for i in 0...self.length
				yield(self[i], i)     
			end
			self
		end


		def my_select
			new_array = []
			for i in 0...self.length
				new_array << self[i] if yield(self[i])
			end
			new_array
		end


		def my_all?
			for i in 0...self.length
				return false if !yield(self[i]) 
			end
			true
		end


		def my_any?
			for i in 0...self.length
				return true if yield(self[i]) 
			end
			false
		end


		def my_none?
			for i in 0...self.length
				return false if yield(self[i])
			end
			true
		end


		def my_count
			count = 0
			for i in 0...self.length
				count += 1 if yield(self[i])
			end
			count
		end


		def my_map
			new_array = []
			for i in 0...self.size
				new_array << yield(self[i])   
			end
			new_array
		end



		def my_inject(accum=self[0])
    		for i in 0...self.size
				accum = yield(accum, self[i])   
			end
			accum
		end
	end
    
    [4,2,1,3].my_inject(8) { |result, element| result * element }

	[1,2,3].my_each { |num| puts num * 3 }
	[1,2,3].my_each_with_index { |num, idx| puts "#{num} #{idx}" }
	[1,2,3,4,5,6,7,8,9,10].my_select { |num| num >= 3 && num <= 7 }
	[1,2,3,4,5,6].my_all? { |num| num == 1 }
	[2,2,3,4,1,6].my_any? { |num| num == 7 }
	[2,2,3,4,1,6].my_none? { |num| num == 2 }
	[2,2,3,4,1,6].my_count { |num| num == 2 }
	[2,2,3,4,1,6].my_map { |num| num * 3 }
	[4,2,1,3].my_inject { |result, element| result + element }

end