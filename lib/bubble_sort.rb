class BubbleSort
  def sort(array)
    swapped = true

    while swapped
      swapped = false

      (array.size - 1).times do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          swapped = true
        end
      end
    end

    array
  end
end
