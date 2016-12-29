# @author Joonatan Kuosa
# @date 2016-12-28

require_relative 'list'

# Only uses operator==
def test_eq(a, b)
	if !(a == b)
		caller_line = caller.first.split(":")[1]
		puts "ERROR: #{a} != #{b} on line #{caller_line}"
	end
end

def print_list(li)
	print "List : ["
	for i in (0...li.size()-1).to_a
		print "#{li[i]}, "
	end
	puts "#{li[li.size()-1]}]"
end

# Tests
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


# Test binary search tree

