# Introduction to divide and conquer

https://www.coursera.org/learn/algorithms-divide-conquer

Dependencies:

`gem install gruff`

## The sorting problem

#### Selection sort -> O(n^2)
#### Insertion sort -> O(n^2)
#### Bubble sort -> O(n^2)
#### Merge sort -> O(nlog(n))

## Benchmarking

To compare the 4 algorithms benchmarking execute:

`ruby sorting_arrays_benchmark.rb`

This also will generate an image `sorting_algorithms.png`

## Asymptotic Analysis

Suppress constant factors and lower-order terms

#### Time complexity

DEF: Given a model of computation and an algorithm A that halts on each input x, the mapping tA:{0, 1}*→N is called the time complexity of A if, for every x, A halts after exactly tA(x) steps.


#### Big O Notation:

DEF: T(n) = O(f(n)) <=> ∃ c, n0 > 0 such that T(n) <= cf(n) ∀ n >= n0


#### Omega Notation:

DEF: T(n) = Ω(f(n)) <=> ∃ c, n0 > 0 such that T(n) >= cf(n) ∀ n >= n0


#### Tetha Notation:

DEF: T(n) = Θ(f(n)) <=> T(n) = O(f(n)) and T(n) = Ω(f(n))


#### Little O Notation:

DEF: T(n) = o(f(n)) <=> ∀ c > 0, ∃ n0 > 0 such that T(n) < cf(n) ∀ n >= n0
