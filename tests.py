# Main program
# Runs tests that check the data structures work correctly
# and report the running time for the operations
#
# Ideally we ran these tests both on our data structures and python's
# native ones and compare the results and run-time

from data_structures import *

# test
# All tests operate only on integers
# this is because the simplest data structure in python is array
# which is only for single primitive type
# and it really doesn't matter for the test cases
print("Data Structure: Queue tests")

def stack_test(cont):
    for i in range(0, 64):
        print("pushing: {}".format(i))
        cont.push(i)
    print("stack size = {}, length = {}".format(cont._size, cont.size()))
    while not cont.empty():
        print("{}".format(cont.pop()))
    print("stack size = {}, length = {}".format(cont._size, cont.size()))
    # TODO add tests that add 33 elements
    # TODO add tests that remove 16 elements
    # add another 30 elements then remove all elements
    # TODO add tests that add one element, then remove it

    # For now always passes since we don't have checking yet
    return True

# LIFO (stack)
ds = stack()
stack_test(ds)

print("\n FIFO test")
# FIFO (queue)
ds = fifo()
stack_test(ds)


#print("\n List test")
# list (single linked list)
# TODO add a similar test as stack test
# TODO add sort tests
# for sort tests we use python's sort as a benchmark
# use randomly generated data: 100, 1000, 10000, 100000 elements


# heap
