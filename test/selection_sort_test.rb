require "minitest/autorun"
require "sorting/selection_sort"

class SelectionSortTest < MiniTest::Test
  def test_selection_sort_with_even_array
    assert_equal(
    	[0, 1, 2, 3, 3, 3, 4, 5, 5, 6, 6, 6, 7, 8, 8, 9],
      Sorting::SelectionSort.new.sort([9, 6, 5, 3, 6, 7, 8, 8, 2, 5, 4, 3, 3, 6, 1, 0])
    )
  end

  def test_selection_sort_with_odd_array
    assert_equal(
      [0, 1, 2, 3, 3, 3, 4, 5, 5, 6, 6, 6, 7, 8, 9],
      Sorting::SelectionSort.new.sort([9, 6, 5, 3, 6, 7, 8, 2, 5, 4, 3, 3, 6, 1, 0])
    )
  end
end
