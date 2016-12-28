# @author Joonatan Kuosa

# linked list
# Implementation distinct elements all over the memory
# we use element wrappers to hold the pointers to next and prev
# All operations on tail and head are O(1) but other operations are O(n)
# more specifically random access is O(n)
#
# For now no O(1) append/remove is provided with Iterators
#
# Rather unsafe since the user can access ListElement, but changing
# the element doesn't change List itself so head and tail might not be
# correct if Elements are modified directly.
class List
	ListElement = Struct.new(:next, :prev, :value)

	# List really only needs a root pointer but
	# for fast appends we keep the tail pointer
	attr :_root, :_tail

	def initialize()
		@_root = nil
		@_tail = nil
	end

	# @brief general purpose append
	# @param index where to add
	# @param value what to add
	# @return ListElement on success, nil on failure
	# return could be replaced by throwing
	def append(index, value)
		# empty list? add root
		if _root.nil?
			@_root = ListElement.new(nil, nil, value)
			@_tail = _root
			return _root
		else
			# off indexing, not adding anything
			# what hapens if we do list::append(list::size())?
			# we take index-1 to get the previous element
			# so that we don't miss indexing when adding to the end of list
			elem = get(index-1)
			if elem.nil?
				return nil
			end
			# adding an element in the middle of list
			ne = ListElement.new(elem.next, elem, value)
			elem.next = ne
			# update tail if necessary
			if ne.next.nil?
				@_tail = ne
			end
			return ne
		end
	end

	# @brief general purpose remove
	# @param index to remove
	# @return the value stored
	def remove(index)
		# FIXME this returns the value not the element
		# need to write an intermediate function for the element
		elem = get(index)
		if !elem.nil?
			elem.prev.next = elem.next
			elem.next.prev = elem.prev
			# update root and tail if necessary
			if elem.next.nil?
				@_tail = elem.prev
			end
			if elem.prev.nil?
				@_root = elem.next
			end
			return elem.value
		end
		return nil
	end

	# O(1) functions
	def pop_front()
	end

	def pop_back()
	end

	def push_front(value)
		elem = ListElement.new(@_root, nil, value)
		if @_root.nil?
			@_root = elem
			@_tail = @_root
		else
			@_root.prev = elem
			@_root = @_root.prev
		end
	end

	def push_back(value)
		elem = ListElement.new(nil, @_tail, value)
		if @_tail.nil?
			@_tail = elem
			@_root = elem
		else
			@_tail.next = elem
			@_tail = elem
		end
	end

	def get(index)
		elem = @_root
		until index == 0 || elem.nil? do
			elem = elem.next
			index-=1
		end
		return elem
	end

	# @brief array accessor
	# O(n) complexity
	def [](index)
		elem = get(index)
		return elem.nil? ? nil : elem.value
	end

	# @brief is container empty
	# return size() == 0
	def empty()
		return @_root.nil?
	end

	# @brief return the number of elements in the container
	# @return interger [0, N] how many elements
	# O(n) complexity
	def size()
		elem = @_root
		if elem.nil?
			puts "size : root is null"
		end
		count = 0
		until elem.nil? do
			count +=1
			elem = elem.next
		end
		return count
	end

end

