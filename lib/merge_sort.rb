class MergeSort
  def self.sort(array)
    return array if array.size <= 1

    middle = array.size / 2
    a = array[0...middle]
    b = array[middle..-1]

    merge(sort(a), sort(b))
  end

  private

  def self.merge(a, b)
    sorted = []
    until a.empty? || b.empty?
      sorted << ((a[0] < b[0]) ? a.shift : b.shift)
    end

    sorted.concat(a).concat(b)
  end
end
