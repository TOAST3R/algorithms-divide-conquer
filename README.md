# Divide and Conquer, Sorting and Searching, and Randomized Algorithms

Course: https://www.coursera.org/learn/algorithms-divide-conquer

Dependencies:

`gem install gruff`

## Integer multiplication

| Algorithm                             | time complexity | Implementation      |
| ------------------------------------- |:---------------:| -------------------:|
| GradeSchool integer multiplication    | O(n²)           | Not implemented yet |
| Gauss recursive integer multiplication| O(n^log2(3))    | Not implemented yet |

## The sorting problem

The problem is to order an array of integers

| Algorithm      | time complexity | Implementation                         |
| -------------- |:---------------:| --------------------------------------:|
| Selection sort | O(n²)           | Sorting::SelectionSort.new.sort(array) |
| Insertion sort | O(n²)           | Sorting::InsertionSort.new.sort(array) |
| Bubble sort    | O(n²)           | Sorting::BubbleSort.new.sort(array)    |
| Merge sort     | O(nlog(n))      | Sorting::MergeSort.new.sort(array)     |

### Sorting Algorithm´s Benchmark

To compare the 4 algorithms benchmarking execute:

`ruby sorting_arrays_benchmark.rb`

This also will generate a graphic comparison:

MergeSort vs InsertionSort vs BubbleSort vs SelectionSort

![alt tag](https://github.com/TOAST3R/sorting_algorithms/blob/master/MergeSort_vs_InsertionSort_vs_BubbleSort_vs_SelectionSort.png)

InsertionSort vs SelectionSort
![alt tag](https://github.com/TOAST3R/sorting_algorithms/blob/master/InsertionSort_vs_SelectionSort.png)

MergeSort vs BubbleSort
![alt tag](https://github.com/TOAST3R/sorting_algorithms/blob/master/MergeSort_vs_BubbleSort.png)

## Count inversions problem

The problem is to compute the number of inversions in the given array of integers.

```
Given an array A containing 1..n in some arbritrary order
DEF: Number of inversions: 
Number of pairs (i,j) of indices with i< j and A(j) < A(i)
```

Largest-possible number of inversions of an n size array: n(n-1)/2.

Brute force: O(n²) time

We should use fast divide-and-conquer algorithm. Versioning MergeSort to count the times were there is a term inverted.

left:       i,j < =n/2 ∀ inversions C(i,j) (with i < j)  
right:      i,j > n/2  ∀ inversions C(i,j) (with i < j)  
split:   i <= n/2 <= j ∀ inversions C(i,j) (with i < j)  

| Algorithm                    | time complexity | Implementation                            |
| ---------------------------- |:---------------:| -----------------------------------------:|
| Inversions Count MergeSort   | O(nlog(n))      | CountInversions.new.sort_and_count(array) |
| Inversions Count Brute force | O(n²)           | Not implemented yet                       |


## Matrix multiplication

Strassen´s subcubic matrix multiplication algorithm (1969)

| Algorithm                         | time complexity | Implementation      |
| --------------------------------- |:---------------:| -------------------:|
| Naive Matrix multiplication       | O(n^3)          | Not implemented yet |
| Strassen´s matrix multiplication  | O(n^2log(7))    | Not implemented yet |


## QuickSort algorithm











# Appendix: Algorithm theory

### Asymptotic Analysis

Suppress constant factors and lower-order terms

#### Time complexity
```
DEF: Given a model of computation and an algorithm A that halts on each input x, the mapping tA:{0, 1}*→N is called the time complexity of A if, for every x, A halts after exactly tA(x) steps.
```

#### Big O Notation:
```
DEF: T(n) = O(f(n)) <=> ∃ c, n0 > 0 such that T(n) <= cf(n) ∀ n >= n0
```

#### Omega Notation:
```
DEF: T(n) = Ω(f(n)) <=> ∃ c, n0 > 0 such that T(n) >= cf(n) ∀ n >= n0
```

#### Tetha Notation:
```
DEF: T(n) = Θ(f(n)) <=> T(n) = O(f(n)) and T(n) = Ω(f(n))
```

#### Little O Notation:
```
DEF: T(n) = o(f(n)) <=> ∀ c > 0, ∃ n0 > 0 such that T(n) < cf(n) ∀ n >= n0
```

## The Master Method

Recurrence Format

1. Base Case : T(n) <= a constant for all sufficiently small n  
2. ∀ n : T(n) <= aT(n/b) + O(n^d)  

where:  
a = number of recursive calls (>= 1)  
b = input size shrinkage factor ( > 1)  
d = exponent in running Fme of “combine step” (>=0) [a,b,d independent of n ]

3 cases of Running time:  
T(n) = O(n^dlog(n)) if a = b^d (case 1) => the amount of work is the same each iteration  
     = O(n^d)       if a < b^d (case 2) => the amount of work is decreasing each iteration  
     = O(n^logb(a)) if a > b^d (case 3) => the amount of work is increasing each iteration

Interpretation:  
a = rate of subproblem proliferation  
b^d = rate of work shrinkable (per subproblem)


Examples:

- MergeSort  
  a = 2  
  b = 2  
  d = 1 => case 1 (a = b^d) => T(n) <= O(nlog(n))

- BinarySearch  
  a = 1  
  b = 2  
  d = 0 => case 1 (a = b^d) => T(n) <= O(log(n))

- Grade School integer multiplication  
  a = 4  
  b = 2  
  d = 1 => case 3 (a > b^d) => T(n) = O(n^log2(4)) = O(n^2)

- Gauss recursive integer multiplication  
  a = 3  
  b = 2  
  d = 1 => case 3 (a > b^d) => T(n) = O(n^log2(3)) <= O(n²) beats grade school

- Strassen´s Matrix multiplication  
  a = 7  
  b = 2  
  d = 2 => case 3 (a > b^d) => T(n) = O(n^log2(7)) <= O(n²) beats naive matrix multiplication

- Ficticious recurrence  
  a = 2  
  b = 2  
  d = 2 => case 2 (a < b^d) => T(n) = O(n²)


