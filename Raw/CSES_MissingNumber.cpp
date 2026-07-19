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
