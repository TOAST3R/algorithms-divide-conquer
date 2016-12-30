# Introduction to divide and conquer

https://www.coursera.org/learn/algorithms-divide-conquer

## The sorting problem:

Selection sort -> O(n^2)
Insertion sort -> O(n^2)
Bubble sort -> O(n^2)
Merge sort -> O(nlog(n))


Claim: Merge sort requires <= 6nlog2n + 6n

level
0 => 16                  0
1 => 8 8                 1
2 => 4 4 4 4             2
3 => 2 2 2 2 2 2 2 2     3
4 => 1 1 1 1 1 1 1 1 1 1 4
...
nlog2(n)


## Asymptotic Analysis

Suppress constant factors and lower-order terms


Big O Notation:

DEF: T(n) = O(f(n)) <=> ∃ c, n0 > 0 such that T(n) <= cf(n) ∀ n >= n0


Omega Notation:

DEF: T(n) = Ω(f(n)) <=> ∃ c, n0 > 0 such that T(n) >= cf(n) ∀ n >= n0


Tetha Notation:

DEF: T(n) = Θ(f(n)) <=> T(n) = O(f(n)) and T(n) = Ω(f(n))


Little O Notation:

DEF: T(n) = o(f(n)) <=> ∀ c > 0, ∃ n0 > 0 such that T(n) < cf(n) ∀ n >= n0
