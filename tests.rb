# @author Joonatan Kuosa

require_relative 'list'

# Tests
l = List.new()
for i in (0..9).to_a
	l.push_back(i)
end
puts "List has #{l.size()} elements"
print "List : ["
for i in (0...l.size()-1).to_a
	print "#{l[i]}, "
end
puts "#{l[l.size()-1]}]"

# print the 8 element
N_ELEM = 5
puts "#{N_ELEM}'th element #{l[N_ELEM]}"
l.remove(N_ELEM)
puts "After removal of #{N_ELEM}"
puts "List has #{l.size()} elements"
puts "#{N_ELEM}'th element #{l[N_ELEM]}"

# TODO test
#	append
#	push_front
#	pop_back
#	pop_front
#	search
#	sort

