require "minitest/autorun"
require "count_inversions"

class CountInversionsTest < MiniTest::Test
  def test_count_split_inversions
    file_name = File.expand_path(File.join(File.dirname(__FILE__), "resources/IntegerArray.txt"))
    array = File.readlines(file_name, "r")[0].split("\n").map(&:to_i)
    assert_equal(CountInversions.new.sort_count_inversion(array)[1], 2407905288)
  end
end
