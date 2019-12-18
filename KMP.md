## KMP

1. 暴力算法怎么做？
2. 如何去优化？

​    

暴力：

```cpp
s[N] = {hellow,world}
p[N] = {world}
 
  h  e  l   l   o  w  ,  w  o  r  l  d
  w o  r   l  d
      w o  r   l  d
          w  o  r  l  d
               w o  r  l  d
                    w o r  l  d
                         w o r  l  d
                             w  o  r  l  d
```





```cpp
s[N],  p[N];
for(int i = 1; i <= n; i ++) {
    bool flag = true;
    for(int j = 1; j <= m; j++) {
      if(s[i + j - 1] != p[j]) {
          flag = false;
          break;
      }  
    }
}
```

```cpp
#include<iostream>
using namespace std;
const int N = 10010, M = 100010;
char s[M], p[N];
int ne[N];
int main() {
    int n, m;
    cin >> n >> p + 1 >> m >> s + 1;
    for(int i = 2, j = 0; i <= n; i++) {
        while(j && p[i] != p[j + 1]) j = ne[j];
        if(p[i] == p[j + 1])j++;
        ne[i] = j;
    }
    for(int i = 1, j = 0; i <= m; i++) {
        while(j && s[i] != p[j + 1]) j = ne[j];
        if(s[i] == p[j + 1])j ++;
        if(j == n) {
            cout << i - n << ' ';
        j = ne[j];
        }
    }
    return 0;
}
```

