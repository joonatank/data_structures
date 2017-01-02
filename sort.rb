# @author Joonatan Kuosa
# @date 2017-01-01
#
# Various sort algorithms
# heap_sort is in the file heap.rb

# Implemented
# 	selection sort
# 	merge sort
# 	bubble sort
# 	insertion sort
# TODO add
# 	quicksort


# @brief inplace selection sort
# @param arr array to sort
# uses O(1) memory, runtime O(n2)
def selection_sort(arr)
	for j in (0...arr.length()-1)
		iMin = j
		for i in (j+1...arr.length())
			if arr[i] < arr[iMin]
				iMin = i
			end
		end

		if iMin != j
			# swap
			tmp = arr[iMin]
			arr[iMin] = arr[j]
			arr[j] = tmp
		end
	end
end

# @brief bubble sort, inplace
# @param arr array to sort
def bubble_sort(arr)
	n = arr.length()
	begin
		swapped = false
		for i in (1...n) do
			if arr[i] < arr[i-1]
				tmp = arr[i]
				arr[i] = arr[i-1]
				arr[i-1] = tmp
				swapped = true
			end
		end
	end until !swapped
end

# @brief insertion sort, inplace
# @param arr array to sort
def insertion_sort(arr)
	n = arr.length()
	for i in (1...n) do
		j = i
		while j > 0 && arr[j] < arr[j-1]
			tmp = arr[j]
			arr[j] = arr[j-1]
			arr[j-1] = tmp
			j -= 1
		end
	end
end

# @brief merge sort, not inplace
# @param arr array to sort
# @return sorted array
# uses O(n) memory, runtime O(nlog(n))
# divide and conquer algorithm
def merge_sort(arr)
	n = arr.length()
	if n == 1 then return arr end

	l1 = arr[(0...n/2)]
	l2 = arr[(n/2...n)]

	l1 = merge_sort(l1)
	l2 = merge_sort(l2)

	return merge(l1, l2)
end

# @brief internal merge algorithm for merge sort
# @param a array to merge
# @param b another array to merge
# Inefficiency problems can be solved by either
# 	using indexes (need to keep three counters though)
# 	or by using LIFO (since we are only adding to back and removing from front)
def merge(a, b)
	# array should be preallocated to right size (but then we need to index it)
	c = Array.new()

	# shifting is no good, should just use indexes
	# need to use first because our arrays are sorted a_n < a_k for all n > k
	while !a.empty? && !b.empty?
		c << (a.first < b.first ? a.shift() : b.shift())
	end

	while !a.empty?
		c << a.shift()
	end

	while !b.empty?
		c << b.shift()
	end

	return c
end

