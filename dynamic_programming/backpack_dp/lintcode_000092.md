## lintcode 92. 背包问题

https://www.lintcode.com/problem/backpack/description

在 N 个物品中挑选若干物品装入背包，最多能装多满？假设背包的大小为 M ，每个物品的大小为 `A[i]`

你不可以将物品进行切割。

样例 1:

```
  输入:  [3,4,8,5], backpack size=10
  输出:  9
```

样例 2:

```
  输入:  [2,3,5,7], backpack size=12
  输出:  12
```

- `O(n x m)` 的时间复杂度 and `O(m)` 空间复杂度
- 如果不知道如何优化空间 `O(n x m)` 的空间复杂度也可以通过.

%

- 状态：`dp[i][j]`，前 i 个物品，在背包大小为 j 的条件下，最多可以装满的空间；
- 状态转移：`dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - A[i - 1]] + A[i - 1])`
  - 关键想法：考虑第 i 个物品“放”或者“不放”
  - 仅有一个物品时，最多可装满的空间就是此物品大小（前提是背包可以装下此物品）
  - 当有多个物品时，要装入一个新物品 `i` ，最多可以装满的空间为：
    - `dp[i - 1][j - A[i - 1]] + A[i - 1]`，（这个反过来比较好想，假设已经装进去第 i 个物品，即 `A[i - 1]`，拿掉它，得到是前 `i - 1` 个物品在容量为 `j - A[i - 1]` 情况下能装满的最大值，即 `dp[i - 1][j - A[i - 1]]`。）
    - 或者不变（装不下新物品），即 `dp[i - 1][j]`
- 初始值：
  - `dp[0][j] = 0;`，没有物品，任何容量能装满的最大空间都是 0
  - `dp[i][0] = 0;`，容量为 0 ，不管几个物品能装满的最大空间都是 0
- 结果：`dp[N][M]`

注意上面的第 `i` 个物品，对应的数组下标是 `i-1`，即 `A[i - 1]` 为第 i 个物品的大小。

```cpp
class Solution {
public:
    /**
     * @param m: An integer m denotes the size of a backpack
     * @param A: Given n items with size A[i]
     * @return: The maximum size
     */
    int backPack(int m, vector<int> &A) {
        // write your code here
        int n = A.size();
        vector<vector<int> > dp(n + 1, vector<int>(m + 1, 0));
        for (int i = 1; i <= n; ++i) {
            for (int j = 1; j <= m; ++j) {
                dp[i][j] = dp[i - 1][j];
                if (j - A[i - 1] >= 0) {
                    dp[i][j] = max(dp[i][j], dp[i - 1][j - A[i - 1]] + A[i - 1]);
                }
            }
        }
        return dp[n][m];
    }
};
```
