require "minitest/autorun"
require "sorting/quick_sort"

class QuickSortTest < MiniTest::Test
  def test_sort_array_first_element_pivot
    file_name = File.expand_path(File.join(File.dirname(__FILE__), "resources/QuickSort.txt"))
    array = File.readlines(file_name, "r")[0].split("\n").map(&:to_i)
    assert_equal(Sorting::QuickSort.new.sort(array, lambda{|x| 0} )[1], 162085)
  end

  def test_sort_array_last_element_pivot
    file_name = File.expand_path(File.join(File.dirname(__FILE__), "resources/QuickSort.txt"))
    array = File.readlines(file_name, "r")[0].split("\n").map(&:to_i)
    assert_equal(Sorting::QuickSort.new.sort(array, lambda{|x| x.length - 1})[1], 164123)
  end
end
