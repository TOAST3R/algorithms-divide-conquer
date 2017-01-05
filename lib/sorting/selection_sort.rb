module Sorting
  class SelectionSort
    def sort(array)
      sorted_array = []

      array.size.times do |i|
        sorted_array << array.delete_at(
          array.each_with_index.min[1]
        )
      end

      sorted_array
    end
  end
end
