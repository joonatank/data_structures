# @author Joonatan Kuosa
# @date 2016-12-29
#
# Heap data structure
# compared to search_tree heap is partially ordered not fully sorted
#
# min heap for the moment

# need basic heap stuff (add, remove, peek)
# creation
# 	- merge
# 	- from array
# rebalance
# 	needed after addition/remove to maintain O(log(n)) complexity
# heap_sort
#
# DONE
# 	- peek
# 	- make heap
# 	- push
# 	- pop
# TODO
# 	- merge
# 	- print
# 	- rebalance
# 	- sort

# Binary heap
# No random access remove
class Heap
	# implementation as an array
	attr :_data
	
	# @brief constructor
	# @param arr array to heapify
	def initialize(arr = nil)
		if arr.nil? 
			@_data = Array.new(0)
		else
			@_data = arr

			# FIXME make heap
			i = (@_data.length()-1)/2
			while i >= 0
				_heapify(@_data, i)
				i -= 1
			end
		end
	end

	# @brief peek the min value
	# @return min value in the heap
	def peek()
		return @_data[0]
	end

	# @brief add a (key) to heap
	# Using only keys instead of (key, values) because it simplifies
	# the usage and reduces copying. User can easily make sortable type
	# that contains the data if the data isn't sortable already.
	def push(key)
		# add to last
		@_data[@_data.length()] = key
		# fix the heap order
		_shift_up(@_data, @_data.length()-1)
	end

	# @brief remove min from the heap
	# @return min value in the heap
	def pop()
		v = @_data[0]
		# last element to first
		@_data[0] = @_data[@_data.length()-1]
		@_data.pop()
		# fix the heap order
		_shift_down(@_data, 0)
		
		return v
	end

	# @brief how many elements in the heap
	# return size of the heap
	def size()
		return @_data.length()
	end

	# @brief shorthand for size() == 0
	# @return true if empty, false otherwise
	def empty()
		return @_data.length() == 0
	end

	# More complex operations
	# TODO should this be a free function (so it doesn't modify this)
	def merge(other)
		# TODO implement
	end

	# Internal
	def _shift_up(arr, index)
		len = arr.length()
		parent = (index-1)/2

		if parent >= 0 && parent < arr.length() &&
				arr[index] < arr[parent]
			# swap
			tmp = arr[parent]
			arr[parent] = arr[index]
			arr[index] = tmp

			# recursion
			_shift_up(arr, parent)
		end
	end

	def _shift_down(arr, index)
		_heapify(arr, index)
	end

	# Working
	# this could be a free function also
	def _heapify(arr, i)
		len = arr.length()
		left = 2*i+1
		right = 2*i+2
		min = i

		if left < len && arr[left] < arr[min]
			min = left
		end
		if right < len && arr[right] < arr[min]
			min = right
		end

		if min != i
			# swap
			tmp = arr[i]
			arr[i] = arr[min]
			arr[min] = tmp
			_heapify(arr, min)
		end
	end
end

def heap_sort(heap)
	# TODO implement
end

