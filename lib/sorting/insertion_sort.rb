module Sorting
  class InsertionSort
    def sort(array)
      array.each_with_index do |item, index|
        i = index - 1 
              
        while i >= 0
          break if item >= array[i]
          array[i+1] = array[i]
          i -= 1
        end
        array[i+1] = item
      end
      
      array
    end
  end
end