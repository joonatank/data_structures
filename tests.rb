# @author Joonatan Kuosa
# @date 2016-12-28

require_relative 'list'
require_relative 'heap'

# Only uses operator==
def test_eq(a, b)
	if !(a == b)
		caller_line = caller.first.split(":")[1]
		puts "ERROR: #{a} != #{b} on line #{caller_line}"
	end
end

def test_bool(a)
	if(!a)
		caller_line = caller.first.split(":")[1]
		puts "ERROR: #{a} on line #{caller_line}"
	end
end

def print_list(li)
	print "List : ["
	for i in (0...li.size()-1).to_a
		print "#{li[i]}, "
	end
	puts "#{li[li.size()-1]}]"
end

def test_set(name)
	puts "### Starting test set: #{name}"
	yield
	puts "### Test Set #{name} DONE"
	puts ""
end

# MAIN Tests
test_set("List") do
	l = List.new()
	for i in (0..9).to_a
		l.push_back(i)
	end
	puts "List has #{l.size()} elements"
	print_list(l)

	# print the 8 element
	N_ELEM = 5
	puts "#{N_ELEM}'th element #{l[N_ELEM]}"
	l.remove(N_ELEM)
	puts "After removal of #{N_ELEM}"
	puts "List has #{l.size()} elements"
	puts "#{N_ELEM}'th element #{l[N_ELEM]}"

	s_before = l.size()
	l.push_back(100)
	test_eq(100, l.back)
	l.append(300, l.size())
	test_eq(300, l.back)

	l.push_front(250)
	test_eq(250, l.front)

	test_eq(l.size(), s_before + 3)
	print_list(l)

	# TODO test append in the middle
	prev_v = l[6]
	l.append(125, 6)
	test_eq(l[6], 125)
	test_eq(l[7], prev_v)
	print_list(l)

	s_before = l.size()
	# 4 pops
	l.pop_front()
	# now the list is [0, 1, 2, ...]
	test_eq(l.pop_front(), 0)
	test_eq(l.pop_front(), 1)
	test_eq(l.pop_front(), 2)
	test_eq(s_before-4, l.size())
	test_eq(l.front(), 3)
	test_eq(l[0], l.front())

	# TODO implement
	#	search
	#	sort
	# TODO run-time analysis
end

# Test binary search tree
test_set("Heap") do
	arr = [5, 2, 1, 11, 69, 10, 85, 35, 3, 4]
	# create an empty heap
	# Add elements from arr
	heap1 = Heap.new()
	test_eq(heap1.size(), 0)
	test_bool(heap1.empty())
	for o in arr
		heap1.push(o)
	end
	print("Heap1 = #{heap1._data}")
	puts ""

	test_eq(heap1.peek(), 1)
	test_bool(!heap1.empty())
	test_eq(heap1.size(), arr.length())

	# create a heap from arr
	heap2 = Heap.new(arr)
	# TODO need print heap
	print("Heap2 = #{heap2._data}")
	puts ""
	test_eq(heap2.peek(), 1)
	test_eq(heap2.size(), arr.length())

	# TODO test pop
	test_eq(heap1.pop(), 1)
	test_eq(heap1.pop(), 2)
	test_eq(heap1.pop(), 3)
	test_eq(heap1.peek(), 4)
	test_eq(heap1.size(), arr.size()-3)
	print("Heap1 = #{heap1._data}")
	puts ""

	# TODO test heap merge

	# TODO test heap sort

	# TODO test large heaps (64+, 1k, 5k, 10k)
end

