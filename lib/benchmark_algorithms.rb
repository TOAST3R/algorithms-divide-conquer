require "benchmark"
require "gruff"

require_relative "./sorting/merge_sort"
require_relative "./sorting/insertion_sort"
require_relative "./sorting/bubble_sort"
require_relative "./sorting/selection_sort"
  
if __FILE__ == $0
  digit_lengths = {}

  algorithms = [
    Sorting::MergeSort.new, 
    Sorting::BubbleSort.new
  ]
  algorithms_times = {}
  
  algorithms.each do |algorithm|
    algorithm_name = algorithm.class.to_s.split("::")[1]
    printf "%-20s", algorithm_name
    algorithms_times[algorithm_name] = []
  end

  printf "%-20s", "Digit length"
  puts

  100.times do |n|
    array = []
    (10 * n).times do |i|
      array << rand(1..n**3)
    end
    array_size = array.to_s.length
    
    algorithms.each do |algorithm|
      algorithm_name = algorithm.class.to_s.split("::")[1]
      algorithms_times[algorithm_name] << (Benchmark.realtime { algorithm.sort array } * 1000).round(5)
      printf "%-20s", algorithms_times[algorithm_name].last
    end
    printf "%-20s", array_size
    puts
    
    digit_lengths[n] = array_size if n % 40 == 0    
  end

  g = Gruff::Line.new
  g.title = "Algorithms Benchmarking"
  g.labels = digit_lengths
  algorithms_times.each do |algorithm_name, times|
    g.data algorithm_name.to_sym, algorithms_times[algorithm_name]
  end
  g.write("#{algorithms_times.keys.join("_vs_")}.png")
end
