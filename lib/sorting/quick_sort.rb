module Sorting
  class QuickSort
    def sort(array, pivot_pos_finder_lambda)
      return array, 0 if (array.length <= 1)
     
      pivot_pos = pivot_pos_finder_lambda.call(array)
     
      array[0], array[pivot_pos] = array[pivot_pos], array[0]
      
      left, pivot, right = partition(array, 0, array.length-1)
     
      sorted_left, left_comparisons = sort(left, pivot_pos_finder_lambda);
      sorted_right, right_comparisons = sort(right, pivot_pos_finder_lambda);
     
      sorted_left.concat(pivot).concat(sorted_right), (array.length - 1 + left_comparisons + right_comparisons)
    end

    def partition(array, left_index, right_index)
      pivot_pos = left_index

      for j in (left_index+1..right_index)
        if (array[j] <= array[left_index])
          array[pivot_pos + 1], array[j] = array[j], array[pivot_pos + 1]
          pivot_pos += 1
        end
      end

      array[left_index], array[pivot_pos] = array[pivot_pos], array[left_index]

      elements_left_of_pivot = pivot_pos-1 < 0 ? [] : array[0..pivot_pos - 1]
      pivot_element = array[pivot_pos..pivot_pos]
      elements_right_of_pivot = array[pivot_pos+1..right_index];

      elements_left_of_pivot, pivot_element, elements_right_of_pivot
    end
  end
end
