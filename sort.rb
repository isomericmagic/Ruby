# In his book 'Learn to Program', Chris Pine asks you to create your own sort method.
# This is my version.
# It can be used to sort any array as long as all the elements are the same type,
# and as far as I can tell does the same thing Ruby's built-in sort method does.

def array_sort(array, returned_array=[])
  x = array.length
  lowest_element = array[0]
  (x - 1).times { |n| lowest_element = array[(n + 1)] if lowest_element > array[(n + 1)] }
  returned_array << lowest_element
  index = array.rindex(lowest_element)
  array.delete_at(index)
  array_sort(array, returned_array) until array.length == 0
  returned_array
end
