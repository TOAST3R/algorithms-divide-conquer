class CountInversions
  def sort_and_count(array)
    return array, 0 unless array.size > 1
    
    left, x   = sort_and_count(array.take(array.size / 2))
    right, y  = sort_and_count(array.drop(array.size / 2))
    sorted, z = merge_count_split_inversion(left, right)
    
    return sorted, x + y + z
  end

  private

  def merge_count_split_inversion(left, right)
    sorted = []
    count = 0
    while left.first && right.first
      if left.first <= right.first
        sorted << left.shift
      else
        sorted << right.shift
        count += left.size
      end
    end

    return sorted.concat(left).concat(right), count
  end
end
