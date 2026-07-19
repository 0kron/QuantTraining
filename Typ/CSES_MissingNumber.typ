#import "../src/writeup.typ":conf

#show: conf.with(
  title: "Missing Numbers",
  source: "CSES",
  url: "https://cses.fi/problemset/task/1083",
  category: "Introductory Problems",
  authors: (
    (
      name: "Ain Bolaños",
      git: "0kron",
    ),
    // Add authors with a new element
  ),
)

// Main document
= Problem
You are given all numbers between $1,2,dots,n$ except one. Your task is to find
the missing number.

- *Input*:
The first input line contains an integer $n$.
The second line contains $n-1$ numbers. Each number is distinct and between $1$
and $n$ (inclusive).

- *Output*:

Print the missing number.

- *Constraints*: $2 <= n <= 2 dot 10^5$

= Solution

As every value but one is given, the sum of all of them, given the $j$-number is
missing will be as follows: $ sum_(i <= n, i != j) x_i = sum_(i<= n, i != j) i $ 

Also the gaussian sum already gives us a way to compute easily the sum of a 
range of numbers, in this case: $ sum_(i <= n) x_i = (n (n - 1))/2 $

Thus we only need to store the sum of the given numbers and substract it from 
the gaussian sum of the values from $1$ to $n$. 

$ x_j = (n(n-1))/2 - sum_(i <= n, i != j) x_i $

As the contraint of $n$ is $2 dot 10^5$, the gaussian sum will exceed clearly 
what can be stored in a 32b integer ($n^2 approx 4 * 10^10$), so a 64b integer (`long long int`) is mandatory. 

Now, the computation of the missing number is in constant time, the only 
obstacle is the reading of the input of $n$ values in total, so the program has
a complexity $O(n)$.

#pagebreak()
= Code
#linebreak()
```cpp
#include<bits/stdc++.h>
using namespace std;
using ll = long long int;

int main(){
	ll n, m, aux = 0, total;
	cin >> n;
	total = n * (n + 1) / 2;
	for (int i = 0; i < n-1; i++){
		cin >> m;
		aux += m;
	}
	printf("%lld\n", total - aux);
	return 0;
}
```
