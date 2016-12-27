# @author Joonatan Kuosa
# @date 2016-12-26
#
# Simple data structure implementations
#
# Design notes
# All data structures are implemented as classes
# this is because Abstract data structures are well defined,
# are self contained so that encapsulation is never broken
# and their implementation works nicely with methods.

from array import array

MIN_SIZE = 16

# dynamic int stack
class stack:
    def __init__(self):
        self.data = array('l')
        self._index = -1
        self.resize(MIN_SIZE)

    def push(self, d):
        if self._size == self._index +1:
            self.resize(self._size*2)
        self.data.append(d)
        self._index += 1

    def pop(self):
        if self._index > -1:
            tmp = self.data[self._index]
            self._index -= 1
            # resize while always leaving at least as many empties
            # as there is filled this because otherwise we get
            # jojo effect if user used pop -> push -> pop
            if MIN_SIZE <= self._size/2  and self._index < self._size/4:
                self.resize(self._size/2)
            return tmp
        return -1

    # Makes no excuses, always resizes
    def resize(self, _size):
        # annoying can't even resize python array... sigh
        # maybe I should be doing this with a different language
        self._size = _size

    def empty(self):
        return self._index == -1

    def size(self):
        return self._index + 1

# Integer fifo
# that is queue
class fifo:
    def __init__(self):
        self._read_index = 0
        self._write_index = 0
        self._data = array('l')
        self.resize(MIN_SIZE)

    def pop(self):
        if self._read_index < self._write_index:
            tmp = self._data[self._read_index]
            self._read_index += 1
            # TODO how is the resize done?
            # the current size
            s = self._write_index - self._read_index
            if MIN_SIZE < self._size and s < self._size/4:
                self.resize(self._size/2)
            return tmp
        return -1
        

    def push(self, d):
        # If write_index == size then we need to resize
        # we can reorder data at resize
        # so that read_index = 0 after resize
        if self._size == self._write_index+1:
            self.resize(self._size*2)
        self._data.append(d)
        self._write_index += 1

    def resize(self, size):
        # Reorder data
        tmp = self._data
        s = self._write_index - self._read_index
        for i in range(0, s):
            self._data[i] = tmp[i+self._read_index]

        self._size = size

    def empty(self):
        return self._read_index == self._write_index

    def size(self):
        return self._write_index - self._read_index

# Deque
class deque:
    def __init__(self):
        pass

    def pop_front(self):
        pass

    def push_front(self, d):
        pass

    def push_back(self, d):
        pass

    def pop_back(self):
        pass

    def empty():
        pass

    def resize():
        pass

