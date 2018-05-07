# Misc data structure things
Some basic data structure things.

Primarily intended as examples and testing things.

Minimal dependencies (just the compiler/interpreter).

Mostly Ruby implementations, since Ruby is so nice to write and you can have proper arrays for stupid low level stuff.
Adding some Haskell samples when I manage to clean them up.

## Structure
Separate files for data structures.
Sort and other algorithms are in their own file as global functions.

### Files
* heap.rb - Binary Max Heap.
* list.rb - Linked list.
* sort.rb - Basic sorting algorithms.
* test.rb - Test program that uses the data structures.
* search_tree.hs - Binary search tree implemented in Haskell.

## Use

### Ruby
Tested with ruby 2.4.3p205 x64
```
ruby test.rb
```

### Haskell
Tested with The Glorious Glassgow Haskell Compiler version 8.2.2

```
ghci
Prelude> :l search_tree.hs
Prelude> main
```

## TODO
* Add more Haskell Trees
* Add performance counters to check O complexity.
* Add quicksort with both Haskell and Ruby.
