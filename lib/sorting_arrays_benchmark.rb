require "benchmark"
require "gruff"

require_relative "./merge_sort"
require_relative "./insertion_sort"
require_relative "./bubble_sort"
require_relative "./selection_sort"

  
if __FILE__ == $0
  digit_lengths = {}

  merge_sort_times = []
  insertion_sort_times = []
  bubble_sort_times = []
  selection_sort_times = []
  
  merge_sort = MergeSort.new
  insertion_sort = InsertionSort.new
  bubble_sort = BubbleSort.new
  selection_sort = SelectionSort.new
  
  printf "%-20s", "MergeSort"
  printf "%-20s", "InsertionSort"
  printf "%-20s", "BubbleSort"
  printf "%-20s", "SelectionSort"
  printf "%-20s", "Digit length"
  puts

  200.times do |n|
    array = rand(10**n..10**(n+1)).to_s.split("")
    array_size = array.to_s.length
    
    merge_sort_times     << (Benchmark.realtime { merge_sort.sort array } * 1000).round(5)
    insertion_sort_times << (Benchmark.realtime { insertion_sort.sort array } * 1000).round(5)
    bubble_sort_times    << (Benchmark.realtime { bubble_sort.sort array } * 1000).round(5)
    selection_sort_times << (Benchmark.realtime { selection_sort.sort array } * 1000).round(5)

    digit_lengths[n] = array_size if n % 40 == 0
    
    printf "%-20s", merge_sort_times.last
    printf "%-20s", insertion_sort_times.last
    printf "%-20s", bubble_sort_times.last
    printf "%-20s", selection_sort_times.last
    printf "%-20s", array_size

    puts
  end

  g = Gruff::Line.new
  g.title = "Array Int Sort Algorithms Benchmark"
  g.labels = digit_lengths
  g.data :MergeSort, merge_sort_times
  g.data :InsertionSort, insertion_sort_times
  g.data :BubbleSort, bubble_sort_times
  g.data :SelectionSort, selection_sort_times
  g.write('sorting_algorithms.png')
end
