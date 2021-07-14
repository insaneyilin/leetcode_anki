## 二进制

%

考察点：

- 异或：一个数异或自己等于 0，一个数异或上 0 不变
- 通过异或可以实现交换两个数
- 移除二进制最后一个 1 ：`n & (n - 1)`
- 获取二进制最后一个 1 ： `n & (n - 1) ^ n`
- 左移一位等价于乘以2：`x << 1;  // x * 2`
- 右移一位等价于除以2：`x >> 1;  // x / 2`