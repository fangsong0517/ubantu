## C语言

[TOC]



#### 第一节：语言入门

1.`scanf`返回值时变量的个数

功 能: 执行格式化输入
用 法: `int scanf(char *format[,argument,...])`;

`scanf()`函数返回成功赋值的数据项数，出错时则返回`EOF`。

格式字符           说明
`%a `                读入一个浮点值(仅`C99`有效)
`%A  `               同上
`%c      `           读入一个字符
`%d     `            读入十进制整数
`%i `                读入十进制，八进制，十六进制整数
`%o  `               读入八进制整数
`%x`                 读入十六进制整数
`%X   `              同上
`%c          `       读入一个字符
`%s             `    读入一个字符串
`%f               `  读入一个浮点数
`%F  `               同上
`%e       `          同上
`%E      `           同上
`%g          `       同上
`%G      `           同上
`%p    `             读入一个指针
`%u      `           读入一个无符号十进制整数
`%n  `               至此已读入值的等价字符数
`%[]    `            扫描字符集合
`%%     `            读%符号

2.`printf`返回值时变量的长度

```cpp
#include<stdio.h>
int main() {
    int n;
    printf("%d\n",scanf("%d", &n));
    printf("%d\n", printf("%d", n));
    printf("%d", printf("hello"));
    return 0;
}
/*
456
1
4563
hello5
*/
```

3.求带空格字段串中字符的个数

`输入字符串中有空格时用scanf("%[^\n]s",str);`

```c
#include<stdio.h>
int main() {
    char str[100];
    scanf("%[^\n]s", str);  // 输入字符串中有空格时用scanf("%[^\n]s",str);
    printf("%d", printf("%s", str));
    return 0;
}
```

4.`"%[^\n]"`

```cpp
while((ret = scanf("%[^\n]s", str)) != EOF) {
        getchar(); // 吃掉/n， 如果没有的话，程序无法停止
        printf("%s ret = %d\n", str, ret);
}
```

4.`sprintf`就是把格式化的数据写入到某个字符串中。返回值字符串的长度。

5.`fprintf`是用于文件操作。

   原型：`int fprintf(FILE *stream,char *format,[argument])；`    

   功能：`fprintf()`函数根据指定的`format`(格式)发送信息(参数)到由`stream`(流)指定的文件.因此`fprintf()`可以使得信息输出到指 定的文件。

6.`stdin`、`stdout`、`stderr`;

`stdout `-- 标准输出设备 `stdout`。 
`stderr `-- 标准错误输出设备 
两者默认向屏幕输出。 
但如果用转向标准输出到磁盘文件，则可看出两者区别。`stdout`输出到磁盘文件，`stderr`在屏幕。 

在默认情况下，`stdout`是行缓冲的，他的输出会放在一个buffer里面，只有到换行的时候，才会输出到屏幕。而`stderr`是无缓冲的，会直接输出。

```cpp
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ cat stderr
stderr = 192.168.1.40
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ cat stdout
stdout = 192.168.1.40
192.168.1.40
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ vim 2.printf.cpp 
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ g++ 2.printf.cpp 
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ ./a.out
192 168 1 40
stdout = 192.168.1.40
stderr = 192.168.1.40
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ cat stdout
stdout = 192.168.1.40
192.168.1.40
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ cat stderr
stderr = 192.168.1.40
fangsong@fangsong-FX503VD:~/Mycode/1.c语言$ cat 2.printf.cpp 
/*************************************************************************
	> File Name: 2.printf.cpp
	> Author:fangsong
	> Mail: 
	> Created Time: 2019年12月01日 星期日 16时31分25秒
 ************************************************************************/
#include <stdio.h>
int main() {
    char str[100], str2[100];
    int ret;
   /* while((ret = scanf("%[^\n]s", str)) != EOF) {
        getchar();
        printf("%s ret = %d\n", str, ret);
    }*/
    /*scanf("%[^\n]s", str);
    getchar();
    */
    int a, b, c, d;
    scanf("%d%d%d%d", &a,&b,&c,&d);
    sprintf(str2, "%d.%d.%d.%d", a, b, c, d);
   // FILE *fd = fopen("out","wb");
    //stdin stdout stderr
    fprintf(stdout, "stdout = %s\n",str2);
    fprintf(stderr, "stderr = %s\n",str2);
  //  printf("%s\n", str2);
    return 0;
}
```

![](/home/fangsong/图片/2019-12-01 18-52-03屏幕截图.png)

#### 第二节：c语言中的数学函数库



头文件：`math.h`

![](/home/fangsong/图片/2019-12-01 19-18-42屏幕截图.png)

`Pi = acos(-1)`

x 是角度值

`cos(x * Pi / 180)` 化为弧度值

pow， sqrt， ceil， floor ，fabs，返回类型double

abs 整形int

换底公式 
$$
log a(b) = log10(b) / 10log(a);
$$

#### 第三节：各种应用

##### 随机数

头文件：`time.h, stdlib.h`

操作：

```cpp
srand (time(0) ); 
// srand(6), 如果打 6， 就不随机了
int a = rand( ) % 100;
```

##### 短路操作`&&`， `||`

```cpp
i && cout << " " ; // 如果i 等于0后面不进行
i || cout << " "; // 如果i != 0 后面不进行
```

3.`do while`与`while`区别

`do while（）`

#### 第四节：分支结构

##### 分支预测：

```cpp
#define likely(x)  __builtin_expect(!!(x), 1);  //  表示 x 的值为真的可能性更大
// 这个是说，如果x == 0，那么结果就是 0，如果x == 1， 那么结果就是1，使用了！！是为了让x转化成bool型的。
#define unlikely(x)  __builtin_expect(!!(x), 0);  // 表示 x 的值为假的可能性更大
//使用 likely() ，执行 if 后面的语句 的机会更大，使用unlikely()，执行else 后面的语句的机会更大。
/*
if( likely(val))
if( unlikely (val))
*/
```

![](/home/fangsong/图片/2019-12-05 18-27-57屏幕截图.png)



1.**`__builtin_ffs(unsigned int n)`**
该函数判断n的二进制末尾最后一个1的位置，从一开始

```cpp
int n = 1;//1
int m = 8;//1000
cout<<__builtin_ffs(n)<<endl;//输出1
cout<<__builtin_ffs(m)<<endl;//输出4
```

2.**`__builtin_popcount(unsigned int n)`**
该函数时判断n的二进制中有多少个1

```cpp
int n = 15; //二进制为1111
cout<<__builtin_popcount(n)<<endl;//输出4
```

3.**`__builtin_ctz(unsigned int n)`**
该函数判断n的二进制末尾后面0的个数，当n为0时，和n的类型有关

```cpp
int n = 1;//1
int m = 8;//1000
cout<<__builtin_ctzll(n)<<endl;//输出0
cout<<__builtin_ctz(m)<<endl;//输出3
```

4.**`__builtin_clz (unsigned int x)`**
返回前导的0的个数。

5.**`__builtin_parity(unsigned int n)`**
该函数是判断n的二进制中1的个数的奇偶性

```cpp
int n = 15;//二进制为1111
int m = 7;//111
cout<<__builtin_parity(n)<<endl;//偶数个，输出0
cout<<__builtin_parity(m)<<endl;//奇数个，输出1
```

#### 第五节：函数

```cpp
**函数定义（函数声明）：**
int is_prime(int x) {
    for(int i = 2; i <= x / 2; i++) {
        if(x % i == 0) {
            return 0;
        }
    }
    retrun 1;
}
/*
int 返回值
is_prime 函数名
int x 参数声明列表
*/
```

##### **K&R风格函数定义(`C99`前):**

```cpp
int is_prime( x )
int x ；
{
    for(int i = 2; i <= x / 2; i++) {
        if(x % i == 0) {
            return 0;
        }
    }
    retrun 1;
}
```

#####  **递归程序**
（自己调用自己）
1.边界条件处理
2.针对问题的`处理过程`和`递归过程`
3.结果返回

栈区 和 堆区

*栈区（stack）* 函数运行时分配，函数结束时释放。由编译器自动分配释放 ，存放为运行函数而分配的局部变量、函数参数、返回数据、返回地址等。其操作方式类似于数据结构中的栈。

*堆区（heap）*一般由程序员分配释放， 若程序员不释放，程序结束时可能由OS（操作系统）回收。分配方式类似于链表。

【若递归调用次数太多，就会只入栈不出栈，于是堆栈就被压爆了，此为栈溢出】。

```cpp
#include<iostream>
using namespace std;
int fac(int n) {             //每一次递归一下自己就开辟4个字节的（int）
    if(n == 0)return 1;   
    return n * fac(n - 1);
}
int main() {
    int n;
    cin >> n;
    cout << fac(n) << endl;
    return 0;
}
```

##### **函数指针**

```cpp
int g(int (*f1)(int), int (*f2)(int), int (*f3)(int), int x) {  // int (*f1)(int)传过来的是函数   `int`返回类型 *f1把某一函数当做变量传过来（int）参数列表， 
    if(x < 0) {
        return f1(x);
    }
    if(x < 100) {
        return f2(x);
    }
    return f3(x);
}
```

`int (*f1)(int)`传过来的是函数  
1 `int`返回类型 
2`*f1`把某一函数当做变量传过来
3`(int)`参数列表， //只写类型

```cpp
#include<iostream>
using namespace std;
int fac1(int n) {
    if(n == 0)return 1;
    return n * fac1(n - 1);
}
int fac2(int n) {
    return (1 + n) * n / 2;
}
int g(int (*func)(int), int (*func2)(int), int x) {
    if(x < 5) {
        return func(x);
    } else {
        return func2(x);
    }
}
int main() {
    int n;
    while(cin >> n) {
        printf("f(%d) = %d\n", n, g(fac1, fac2, n));
    }
    return 0;
}
```

![](/home/fangsong/图片/2019-12-07 15-55-08屏幕截图.png)

```cpp
#include<iostream>
using namespace std;
#include <inttypes.h>
typedef int64_t int1;
int1 Triangle(int1 n) {
    return n*(n + 1) / 2;
}
int1 Pentagonal(int1 n) {
    return n * (3 * n - 1) / 2;
}
int1 Hexagonal(int1 n) {
    return n * ( 2 * n - 1);
}
int1 binary_search(int1 (*func)(int1),int1 x) {
    int1 head = 1, tail = x, mid ;
    while(head <= tail) {
        mid = (head + tail) / 2;
        if(func(mid) == x)return mid;
        if(func(mid) < x)head = mid + 1;
        else tail = mid - 1;
    }
    return -1;
}
int main() {
    int n = 286;
    for(;; n++) {
        if(binary_search(Triangle, Hexagonal(n)) == -1)continue; //3 5
        if(binary_search(Pentagonal, Hexagonal(n)) == -1)continue;//3 6
        printf("%" PRId64 "\n", Hexagonal(n));
        break;
    }
    return 0;
}
```

##### **变参函数**

实现可变参`max_int`, 从若干个传入的参数返回最大值

`int max_int(int a, ... );` "..."传入的变参

如何获得a往后的参数列表？`va_list`类型的变量

如何定位a往后的第一个参数的位子？`va_start`函数

如何获取下一个可变参列表中的参数？`va_arg`函数

如何结束整个获取可变参数列表的动作？`va_end`函数

```cpp
#include<iostream>
using namespace std;
#include<stdarg.h>
#include<inttypes.h>
int max_int(int n, ...) { 
    // n 个数字最大
    va_list arg; //定义一个变量
    va_start(arg, n); // 从n后第一个参数值开始放在arg中
    int ans = INT32_MIN;
    while(n --) {
        int temp = va_arg(arg, int); //取arg里的值，顺序取值
        temp > ans && (ans = temp);
    }
    va_end(arg); //销毁
    return ans;
}
int main() {
    printf("%d\n",max_int(3, 3, 5, 16));
    printf("%d\n",max_int(4, 4, 5, 17, 21));
    printf("%d\n",max_int(4, 4, 5, 21, -32));
    return 0;
}
```

宏：

```cpp
#include<iostream>
#include<cstdio>
using namespace std;
#define swap_n(a, b) {\
    __typeof(a) __temp = a;\
    a = b, b = __temp;\
}
int main() {
   int a, b;
    cin >> a >> b;
    swap_n(a, b);
    cout << a << ' ' << b << endl;
   return 0; 
}
```

#### 第六节：算法

##### **欧几里得算法**

* 1、又名辗转相除
* 2、用于快速计算两个数字的最大公约数
* 3、还可以快速求解`a * x + b * y =  1`的一组整数解

假想`gcd（a, b） _=  gcd(b, a % b)`     恒等号：`_=`

`gcd(a, b) = r `, `r`最大

![](/home/fangsong/图片/2019-12-07 18-35-02屏幕截图.png)

```cpp
#include<iostream>
using namespace std;
int gcd(int a, int b) {
    return b ? gcd(b, a % b) : a;
}
int main() {
    int a, b;
   while(cin >> a >> b) {
    cout << gcd(a, b) << endl;
   }
    return 0;
}
```

##### **扩展欧几里得算法**

推导过程：

![](/home/fangsong/图片/2019-12-07 19-44-23屏幕截图.png)

```cpp
#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstring>
#include<iomanip>
#include<algorithm>
#include<map>
#include<vector>
using namespace std;
int ex_gcd(int a, int b, int *x, int *y) {
    if(!b) {
        *x = 1;
        *y = 0;
        return a;
    }
    int xx, yy,ret = ex_gcd(b, a % b, &xx, &yy);
    *x = yy;
    *y = xx - (a / b) * yy;
    return ret;
}
int main() {
    int a, b, x, y;
    cin >> a >> b;
    cout << ex_gcd(a, b, &x, &y) << endl;
    return 0;
}

```

#### 第七节：数组与字符串

##### `prime.cpp`

```cpp

#include <stdio.h>
#define MAX_N 1000
/* 
int prime[MAX_N + 5];

void init_prime() {
    prime[0] = prime[1] = 1;
    for (int i = 2; i * i <= MAX_N; i++) {
        if (prime[i]) continue;
        for (int j = i * i; j <= MAX_N; j += i) {
            prime[j] = 1;
        }
    }
    return ;
}
*/

void init_prime() {}
int prime(int x) {
    if (x <= 1) return 1;
    for (int i = 2; i * i <= x; i++) {
        if (x % i) continue;
        return 1;
    }
    return 0;
}

int main() {
    init_prime();
    int x;
    while (~scanf("%d", &x)) {
        printf("%s\n", prime(x) ? "No" : "Yes");
    }
    return 0;
}
```

##### 数组与地址关系

```cpp
#include <stdio.h>

int func(int n) { // 形参
    return 0;
}
int func1(int *n) { // *n接收
    n = 123;
    return 0;
}
int func3(int *a, int n) {
    //a[3]和 a + 3一样
    /*
    *a = sizeof(a)= 8; 而主函数中arr = sizeof(arr) = 400;
    *a 本身表示指向整形的变量;arr是外部总共字节4 * 100 = 400;
    */
    return 0;
}
/*
arr + 0 
&a[0] 
*/

int func4(int *a, int n){ // 一位数组    
}
int func5(int *a[1500], int n) { //二维数组
}
int func6(int *a[1500][1500], int n) { //三维数组
}
int main() {
    int arr[100];
    printf("arr = %p, &arr[0] = %p\n", arr, &arr[0]); 
    printf("arr + 1 = %p, &arr[1] = %p\n", arr + 1, &arr[1]); 
    char *p = (char *)arr;
    printf("p + 1 = %p, p + 2 = %p", p + 1, p + 2); // 其地址相差1（char）
    int n = 0;
    scanf("%d", &n);
    func(n); // 实参
    func1(&n); //传参
    for(int i = 0; i < n; i++) {
        scanf("%d", arr + i);
    }
    func3(arr, n);
    func4(arr, n);
    func5(arr, n);
    func6(arr, n);
    
return 0；
}
```

```cpp
#include <stdio.h>

int func_2(int (*a)[200][300]) {
    return 0;
}

int main() {
    int arr[100][200][300];
    func_2(arr);
    printf("&arr[0] = %p  arr = %p\n", &arr[0], arr);
    printf("arr + 1 = %p  arr + 2 = %p\n", arr + 1, arr + 2);
    char *p = (char *)arr;
    printf("p + 1 = %p  p + 2 = %p\n", p + 1, p + 2);
    printf("sizeof(arr) = %lu\n", sizeof(arr));
    return 0;
}
```



#### 第八节：

##### 函数补充

```cpp
#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstring>
#include<iomanip>
#include<algorithm>
#include<map>
#include<vector>
using namespace std;

int funcA(int);    // 必须得加， 为了告诉程序运行到funcB时中有一个funcA， 声明作用
int funcB(int n) {
    printf("funcB : %d\n", n);
    if(n == 0) return 0;
    funcA(n - 1);
    return n;
}
int funcA(int n) {
    printf("funcA : %d\n", n);
    if(n == 0)return 0;
    funcB(n - 1);
    return n;
}
int main() {  
}
```

##### 多文件编译

选项 -c 用来告诉编译器编译源代码但不要执行链接，输出结果为对象文件。文件默认名与源码文件名相同，只是将其后缀变为 .o。

```cpp
g++ -c 1.cpp // 生成-o文件1
g++ -c 2.cpp // 生成-o文件2
g++ 1.o 2.o 
```

##### 创建静态库

静态库是编译器生成的一系列对象文件的集合。链接一个程序时用库中的对象文件还是目录中的对象文件都是一样的。库中的成员包括普通函数，类定义，类的对象实例等等。静态库的另一个名字叫归档文件(archive)，管理这种归档文件的工具叫 ar 。

在下面的例子中，我们先创建两个对象模块，然后用其生成静态库。

头文件 say.h 包含函数 sayHello() 的原型和类 Say 的定义：

```
 1 /* say.h */
 2 #include <iostream>
 3 void sayhello(void);
 4 class Say {
 5     private:
 6         char *string;
 7     public:
 8         Say(char *str)
 9         {
10             string = str;
11         }
12         void sayThis(const char *str)
13         {
14             std::cout << str << " from a static library\n";
15         }
16         void sayString(void);
17 };
```

 

下面是文件 say.cpp 是我们要加入到静态库中的两个对象文件之一的源码。它包含 Say 类中 sayString() 函数的定义体；类 Say 的一个实例 librarysay 的声明也包含在内：

```
1 /* say.cpp */
2 #include "say.h"
3 void Say::sayString()
4 {
5     std::cout << string << "\n";
6 }
7 
8 Say librarysay("Library instance of Say");
```



源码文件 sayhello.cpp 是我们要加入到静态库中的第二个对象文件的源码。它包含函数 sayhello() 的定义：



```
1 /* sayhello.cpp */
2 #include "say.h"
3 void sayhello()
4 {
5     std::cout << "hello from a static library\n";
6 }
```

下面的命令序列将源码文件编译成对象文件，命令 ar 将其存进库中：

```
1 $ g++ -c sayhello.cpp
2 
3 $ g++ -c say.cpp
4 
5 $ ar -r libsay.a sayhello.o say.o
```

程序 ar 配合参数 -r 创建一个新库 libsay.a 并将命令行中列出的对象文件插入。采用这种方法，如果库不存在的话，参数 -r 将创建一个新的库，而如果库存在的话，将用新的模块替换原来的模块。

下面是主程序 saymain.cpp，它调用库 libsay.a 中的代码：

```
 1 /* saymain.cpp */
 2 #include "say.h"
 3 int main(int argc,char *argv[])
 4 {
 5     extern Say librarysay;
 6     Say localsay = Say("Local instance of Say");
 7     sayhello();
 8     librarysay.sayThis("howdy");
 9     librarysay.sayString();
10     localsay.sayString();
11     return(0);
12 }
```

 

该程序可以下面的命令来编译和链接：

```
1 $ g++ saymain.cpp libsay.a -o saymain
```

程序运行时，产生以下输出：

```
hello from a static library

howdy from a static library

Library instance of Say

Local instance of Say
```

##### 实现简易的printf函数

```cpp
#include <stdio.h>
#include <inttypes.h>
#include <stdarg.h>

int reverse_num(int num, int *temp) {
    int digit = 0;
    do {
        *temp = *temp * 10 + num % 10;
        num /= 10;
        digit += 1;
    } while(num);
    return digit;
}

int output_num(int temp, int digit) {
    int cnt = 0;
    while (digit--) {
        putchar(temp % 10 + '0');
        temp /= 10;
        cnt += 1;
    }
    return cnt;
}

int my_printf(const char *frm, ...) {
    int cnt = 0;
    #define PUTC(a) putchar(a), ++cnt
    va_list arg;
    va_start(arg, frm);
    for (int i = 0; frm[i]; i++) {
        switch (frm[i]) {
            case '%': {
                switch (frm[++i]) {
                    case 'd': {
                        int xx = va_arg(arg, int);
                        uint32_t x;
                        if (xx < 0) PUTC('-'), x = -xx;
                        else x = xx;
                        int num1 = x / 100000, num2 = x % 100000;
                        int temp1 = 0, temp2 = 0;
                        int digit1 = reverse_num(num1, &temp1);
                        int digit2 = reverse_num(num2, &temp2);
                        if (num1) digit2 = 5;
                        else digit1 = 0;
                        cnt += output_num(temp1, digit1);
                        cnt += output_num(temp2, digit2);
                    } break;
                    case '%': {
                        PUTC(frm[i]);
                    } break;
                    case 's': {
                        const char *str = va_arg(arg, const char *);
                        for (int i = 0; str[i]; i++) {
                            PUTC(str[i]);
                        }
                    } break;
                }
            } break;
            default: PUTC(frm[i]); break;
        }
    }
    va_end(arg);
    #undef PUTC
    return cnt;
}

int main() {
    int a = -123;
    printf("hello world\n");
    my_printf("hello world\n");
    printf("int (a) = %d\n", a);
    my_printf("int (a) = %d\n", a);
    printf("INT32_MAX = %d\n", INT32_MAX);
    my_printf("INT32_MAX = %d\n", INT32_MAX);
    printf("INT32_MIN = %d\n", INT32_MIN);
    my_printf("INT32_MIN = %d\n", INT32_MIN);
    char str[100] = "I love Beijing !";
    printf("%s\n", str);
    my_printf("%s\n", str);
    return 0;
}
```



##### 二分查找 & 牛顿迭代

函数是压缩的数组，数组是函数的展开

```cpp
#include<iostream>
using namespace std;
//0 1 2 3 4   5  6  7
//0 1 4 9 16 25 36 49
int f(int x) {
    return x * x;
}
int binary_search(int (*arr)(int), int x, int n) {
    int l = 0, r = n - 1, mid;
    while(l <= r) {
        mid = (l + r) >> 1;
        if(arr(mid) == x) return mid;
        if(arr(mid) < x) l = mid + 1;
        else r = mid - 1;
    }
    return -1;
}

int main() {
    int y;
    while(~scanf("%d", &y)) {
        int x = binary_search(f, y, 100);
       printf("%d * %d = %d\n", x , x, y ); 
    }
 return 0;
}
```

###### 牛顿迭代

求x * x  - 2 = 0

```cpp
#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstring>
#include<iomanip>
#include<algorithm>
#include<map>
#include<vector>
using namespace std;
#define exp 1e-6
double F(double x) {
    return x * x - 2; 
}

double f(double x) {
    return 2 * x;
}

double NewTon(double (*F)(double), double (*f)(double)) {
    double x = 1.0;
    while(fabs(F(x)) > exp) {
        x -= F(x) / f(x);
    }
    return x;
}


int main() {
    printf("%lf\n",NewTon(F, f) );
    return 0;
}
```

###### 二分拓展：

1. 一组数 ：1 2 3 4 5 6 6 6 6 7 7 8 9， 查找第一个“6”

2. 一组数 ：00000001111111查找第一个“1”；

   ```cpp
   int binary_search1(int *arr, int n) {
       int head = 0, tail = n - 1, mid;
       while(head < tail) {
           mid = (head + tail) >> 1;
           if(arr[mid] == 1) tail = mid;
           else head = mid + 1;
       }
       return head;
   }
   ```

3. 一组数：11111111000000查找最后一个“1”；

   ```cpp
   int binary_search2(int *arr, int n) {
       int head = -1, tail = n - 1, mid;
       while(head < tail) {
           mid = (head + tail + 1) >> 1;
           if(arr[mid] == 1)head = mid;
           else tail = mid - 1;
       }
       return head;
   }
   ```

   



#### 第九节、预处理命令－宏定义

定义符号常量：

```cpp
#define PI 3.1415926
#define MAX_N 10000
```

定义傻瓜表达式：

```cpp
#define MAX(a, b) (a) > (b) ? (a) : (b)
#define S(a, b)  a * b; // 只是想替换对应的变量(简单替换)
/*
S(3 + 4, 5 + 6) = 3 + 4 * 5 + 6
*/
```

定义代码段：

```cpp
#define P(a) { \　
          printf("%d\n", a);\
}
```



| 宏                    | 说明                    |
| --------------------- | ----------------------- |
| `__DATE__`            | 日期：`Mmm dd yyyy`     |
| ` __TIME__`           | 时间：`hh:mm:ss`        |
| `__LINE__`            | 行号                    |
| `__FILE__`            | 文件名                  |
| `__func__`            | 函数名/非标准           |
| `__FUNC__`            | 函数名/非标准           |
| `__PRETTY_FUNCTION__` | 更详细的函数信息/非标准 |

条件式编译

![](/home/fangsong/图片/宏－条件式编译.png)

![](/home/fangsong/图片/预处理命令.png)

对象文件：
Ｌｉｎｕｘ：　.o　结尾　　　　　　　　　　　　　　　　　　　
Ｗｉｎｄｏｗｓ: 　.obj　结尾　

* max.cpp　　　　　　　　　

```cpp
#include <stdio.h>

#define MAX(a, b) ({ \
    __typeof(a) _a = (a); \
    __typeof(b) _b = (b); \
    _a > _b ? _a : _b; \
})

#define P(a) { \
    printf("[%s : %d] %s = %d\n", __func__, __LINE__, #a, a); \   
}

int main() {
    int a = 7;
    P(MAX(2, 3));
    P(5 + MAX(2, 3));
    P(MAX(2, MAX(3, 4)));
    P(MAX(2, 3 > 4 ? 3 : 4));
    P(MAX(a++, 6));
    P(a);
    return 0;
}

```



```cpp
#include<stdio.h>

#ifdef DEBUG    //如果使用g++ DEBUG fs.cpp就执行以下语句到 #else

#define log(frm, arg...) { \
    printf("[%s : %s : %d]",__FILE__, __func__, __LINE__ );\
    printf(frm, ##arg);\
    printf("\n");\
}
#else  // 否则执行下面语句到#endif
#define log(frm, arg...)
#endif

#define contact(a, b) a##b  //##代表链接连个字符

int main() {
    int a = 123;
    log("%d", a);
    int abcdef = 15;
    contact(abc, def);
    log("%d\n", abcdef);
    log("hello world");
    return 0;
}

/*
"##"是使其停止展开
当遇到“＃”或者“＃＃”停止展开
“＃”字符串化
“＃＃”将其接到一起
*/

```

![](/home/fangsong/图片/g++ -E.png)

#### 第十节、字符串

![](/home/fangsong/图片/字符串.png)

`strlen(str[i]) == 0, `可以结束，因为'\0' = 0
`strcmp(str1, str2) `
返回值　`> 0  ,< 0 ,= 0`
`strcpy(dest, src) `
`strncmp(str1, str2, n),` 最多比较ｎ位
`strncpy(str1, str2, n);`　最多拷贝ｎ位

`memset`是将其每一位字节初始化为c;
`memset(str, - 1, sizeof(str));` 可以赋值为`-1`

![](/home/fangsong/图片/sscanf&sprintf.png)

1.`sprintf`就是把格式化的数据写入到某个字符串中。返回值字符串的长度。
 ` sprintf(str, "%x", n) `将n以十六进制写入字符串`str`中

2.`sscanf`往一个变量赋值.

```cpp
#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstring>
#include<iomanip>
#include<algorithm>
#include<map>
#include<vector>
#include<inttypes.h>
using namespace std;
void test_sscanf() {
    char str1[] = "123 456 789 987";
    char str2[100];
    int  a, b, c, d;
    sscanf(str1, "%d%[^$]s", &a, str1); // "$"代表末尾  str1 = 456 789 987
    sscanf(str1, "%d%[^$]s", &b, str1);//其每一次str1都在变，是剩余的一些 str1 = 789 987
    sscanf(str1, "%d%[^$]s", &c, str1); // str1 = 987
    sscanf(str1, "%d%[^$]s", &d, str1);// str1 = 987
    // sprintf(str2, "a = %db = %dc = %dd = %d", a, b, c, d);
    int offset = 0;  // offset代表偏移量
    offset += sprintf(str2 + offset, "a = %d", a);  
    offset += sprintf(str2 + offset, "b = %d", b);
    offset += sprintf(str2 + offset, "c = %d", c);
    offset += sprintf(str2 + offset, "d = %d", d);
    printf("%s\n", str2);
    printf("a = %d b = %dc = %dd = %d", a , b, c, d);
   
}

uint64_t strlen1(const char *str) {
    uint64_t i = 0;
    while(str[i])i++;
    return i;
}

int strcmp1(const char *str1, const char *str2) {
    int i = 0;
    for(;str1[i]&&str2[i];i++) {
        if(str1[i] - str2[i]) return str1[i] - str2[i];
    }
    return str1[i] - str2[i];
}

int main() {
    int n, w;
    /* char str[100];
    while(~scanf("%d", &n)) {
        w =  sprintf(str,"%x", n);
        printf("%d\n",w);
    }*/
    //test_sscanf();
    char str[100] = "hello haizei";
    printf("%" PRIu64 "\n", strlen1(str));
    printf("%" PRIu64 "\n", strlen1("hello world"));
    return 0;
}
```





#### 十一、结构体与指针



**共用体：union**

```cpp
IP转整形：
#include<iostream>
using namespace std;
union IP {
    unsigned int num;
    struct {
        unsigned char a1;
        unsigned char a2;
        unsigned char a3;
        unsigned char a4;
    }ip;
};
int main() {
    IP p;
    char str[25];
    int a, b ,c, d;
    int arr[4];
    while(~scanf("%s", str)) {
        sscanf(str, "%d.%d.%d.%d", arr , arr + 1, arr + 2, arr + 3 );
        p.ip.a1 = arr[0];
        p.ip.a2 = arr[1];
        p.ip.a3 = arr[2];
        p.ip.a4 = arr[3];
        printf("%d\n",  p.num);

    }
    return 0;
}
```



大端机和小端机

![](/home/fangsong/图片/小端机.png)

![](/home/fangsong/图片/xiaoduanji.png)

大端机：字节低位在高位

小端机：字节低位在低位

**指针：**



![](/home/fangsong/图片/指针.png)

```cpp
#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstring>
#include<iomanip>
#include<algorithm>
#include<map>
#include<vector>
using namespace std;

struct Data {
    int x, y;
};
struct Data a[2], *p = a;
int main() {
    a[1].x = 5;
    
    //地址用->
    //变量名用   .  
    printf("%d\n", a[1].x);
    printf("%d\n", (p + 1)->x);
    printf("%d\n", (*(p + 1)).x);
    printf("%d\n",   (&a[1])->x);
    printf("%d\n", (a + 1)->x);
    printf("%d\n",   (p[1]).x);
    return 0;
}
```

![](/home/fangsong/图片/2019-12-14 20-12-06屏幕截图.png)

![2019-12-14 20-12-22屏幕截图](/home/fangsong/图片/2019-12-14 20-12-22屏幕截图.png)

![2019-12-14 20-33-21屏幕截图](/home/fangsong/图片/2019-12-14 20-33-21屏幕截图.png)

![2019-12-14 20-40-10屏幕截图](/home/fangsong/图片/2019-12-14 20-40-10屏幕截图.png)

求地址的偏移量：

```cpp
#define offset(T, a) ({\
    T tmp;\
   (char *)&tmp.a - (char *)&tmp;\
})

#define offset(T, a) (long long)(&(((T *)(NULL))->a))
struct Data {
    double a;
    int b;
    char c;
};

printf("%ld\n", offset(struct Data, a));
printf("%ld\n", offset(struct Data, b));
printf("%ld\n", offset(struct Data, c));
```



```cpp

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define offset(T, a) (long long)(&(((T *)(NULL))->a))
#define pchar char *
typedef char * ppchar;

struct Data {
    int a;
    double b;
    char c;
};

void output_args(int argc, char *argv[], char *env[]) {
    for (int i = 0; i < argc; i++) {
        printf("argv[%d] = %s\n", i, argv[i]);
    }
    for (int i = 0; env[i]; i++) {
        printf("env[%d] = %s\n", i, env[i]);
        if (strncmp(env[i], "USER=", 5) == 0) {
            if (strcmp(env[i] + 5, "huguang")) {
                printf("you are not CpatainHu, don't run me, Gun!");
                exit(0);
            }
        }
    }
    return ;
}

int main(int argc, char *argv[], char *env[]) {
    int num1 = 0x616263;
    int num2 = 0x61626364;
    printf("%s", (char *)(&num2 + 1));
    printf("%lld\n", offset(struct Data, a));
    printf("%lld\n", offset(struct Data, b));
    printf("%lld\n", offset(struct Data, c));
    pchar p1, p2;
    ppchar p3, p4;
    printf("sizeof(p1) = %lu sizeof(p2) = %lu\n", sizeof(p1), sizeof(p2));
    printf("sizeof(p3) = %lu sizeof(p4) = %lu\n", sizeof(p3), sizeof(p4));
    output_args(argc, argv, env);
    return 0;
}
```

```cpp
#include<stdio.h>
#include <string.h>
#include<stdlib.h>
#define offset(T, a) (long long)(&((T *)(NULL))->a)

#define pchar char *
typedef char * ppchar;
struct Data {
    double a;
    int b;
    char c;
};
/*
void output_main(int argc, char *argv[]) {
    for(int i = 0; i < argc; i++) {
        printf("argv[%d] = %s\n", i, argv[i]);
    }
    return;
}
*/

void output_main1(int argc, char *argv[], char *env[]) {
    for(int i = 0; env[i]; i++) {
    printf("env[%d] = %s\n", i, env[i]);
        if(strncmp(env[i], "USER=", 5) == 0) {
            if(strncmp(env[i] + 5, "fangsong", 8)) {
                printf("you are not user!\n");
                exit(0);
            }
        }
    }
    return;
}

int main(int argc, char *argv[], char *env[]) {
  //  output_main(argc, argv);
    int num1 = 0x616263;
    int num2 = 0x61626364;
    output_main1(argc, argv, env);
   /* printf("%s\n", (char *)(&num1));
    printf("%s\n", (char *)(&num2));*/
   // printf("%s\n", (char *)(&num2 + 1));
    offset(struct Data, a);
    printf("%lld\n", offset(struct Data, a));
    printf("%lld\n", offset(struct Data, b));
    printf("%lld\n", offset(struct Data, c));
    pchar p1, p2;
    ppchar p3, p4;
printf("sizeof(p1) = %lu , sizeof(p2) = %lu \n",sizeof( p1) ,sizeof( p2 ));
printf("sizeof(p3) = %lu , sizeof(p4) = %lu \n",sizeof( p3) ,sizeof( p4 ));
      
    return 0;
}

```

