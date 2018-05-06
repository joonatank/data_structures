# @author Joonatan Kuosa
# @date 2016-12-29
#
# Heap data structure
# compared to search_tree heap is partially ordered not fully sorted
#

# Operators
# 	- peek
# 	- make heap
# 	- push
# 	- pop
# 	- print
# 	- merge
# 	- sort

# Binary MAX heap
class Heap
	# implementation as an array
	attr :_data

	# @brief constructor
	# @param arr array to heapify
	def initialize(arr = nil)
		if arr.nil?
			@_data = Array.new(0)
		else
			# This isn't copy constructor it's a copy of the reference
			@_data = arr

			i = (@_data.length()-1)/2
			while i >= 0
				_heapify(@_data, i, @_data.length())
				i -= 1
			end
		end
	end

	# @brief peek the max value
	# @return max value in the heap
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
		len = @_data.length()
		_shift_up(@_data, len-1, len)
	end

	# @brief remove min from the heap
	# @return min value in the heap
	def pop()
		v = @_data[0]
		# last element to first
		@_data[0] = @_data[@_data.length()-1]
		@_data.pop()
		# fix the heap order
		_shift_down(@_data, 0, @_data.length())

		return v
	end

	# In place sort
	# sort to [min, max] with max heap
	# we need to move the heap index by +1 for every iteration of the sorting
	# so the heap is at arr[i, N], while the sorted data is at [0, i[
	# then we can do arr[i] = pop(i), for all i in [0, N]
	# using a max heap it's actually easier to sort
	# since we can do arr[len-i] = pop
	#
	# if we pass array here we need to
	# contruct heap
	# keep the heap at [0, i], keep sorted data at ]i, len]
	def sort()
		# We need to modify the array here

		len = @_data.length()-1
		for i in (0..len)
			# [0..i] is unsorted part of the array [i..len] is already sorted
			# Unsorted part contains the heap, first element the largest.
			# The sorted part has the largest element as last.
			#
			# We swap elements from the heap to the sorted part
			# Then redo the heap for one element less.
			tmp = @_data[len-i]
			@_data[len-i] = peek()
			@_data[0] = tmp
			_shift_down(@_data, 0, len-i)
		end
	end

	# @brief how many elements in the heap
	# @return size of the heap
	def size()
		return @_data.length()
	end

	# @brief shorthand for size() == 0
	# @return true if empty, false otherwise
	def empty()
		return @_data.length() == 0
	end

	# More complex operations

	# @brief Merge another heap into this one
	# @param other heap to add to this one
	# TODO should this be a free function (so it doesn't modify this)
	def merge(other)
		@_data.concat(other._data)
		len = @_data.length()

		# Redo the heap
		i = (len-1)/2
		while i >= 0
			_heapify(@_data, i, len)
			i -= 1
		end
	end

        # @brief print to standard out
        # Formats it like a tree
        # X
        # X X
        # X X X X
	def print_()
		len = @_data.length()
		i = 1
		while i <= len do
			for j in (1..i)
				# need - 2 since we are indexing both i, j from [1, len]
				print("#{@_data[i+j-2]}\t")
			end
			puts ""
			# every level has 2 times as many elements than the last
			# level 1: pow(2, 0)
			# level 2: pow(2, 1)
			# level 3: pow(2, 2) etc.
			i *= 2
		end
	end

	# Internal
        # Move an object up in the heap, till parent is larger
	def _shift_up(arr, index, len)
		parent = (index-1)/2

		if parent >= 0 && parent < len &&
				arr[index] > arr[parent]
			# swap
			tmp = arr[parent]
			arr[parent] = arr[index]
			arr[index] = tmp

			# recursion
			_shift_up(arr, parent, len)
		end
	end

	def _shift_down(arr, index, len)
		_heapify(arr, index, len)
	end

        # Make an array into a heap
        # Moves an array element at position i down the heap if it's smaller than it's children
        # Continue till all children are smaller than the parent
        #
	# this could be a free function also
	def _heapify(arr, i, len)
		left = 2*i+1
		right = 2*i+2
		min = i

		if left < len && arr[left] > arr[min]
			min = left
		end
		if right < len && arr[right] > arr[min]
			min = right
		end

		if min != i
			# swap
			tmp = arr[i]
			arr[i] = arr[min]
			arr[min] = tmp

			_heapify(arr, min, len)
		end
	end
end

# @brief sort an array inplace
# @param arr array to sort
def heap_sort(arr)
	# Construct a MAX heap
	# Heap data structure modifies directly the array
	heap = Heap.new(arr)
	# sort the array
	heap.sort()
end

