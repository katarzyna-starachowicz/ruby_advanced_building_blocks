def bubble_sort(array)
  swap = true
  while swap do
    swap = false
    0.upto(array.length - 2).each do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index +1], array[index]
        swap = true
      end
    end
   end
  array
end