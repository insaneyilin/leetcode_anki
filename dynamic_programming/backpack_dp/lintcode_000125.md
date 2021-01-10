## lintcode 125. 背包问题 II

https://www.lintcode.com/problem/backpack-ii/description

描述

有 n 个物品和一个大小为 m 的背包. 给定数组 A 表示每个物品的大小和数组 V 表示每个物品的价值.

问最多能装入背包的总价值是多大?

1. `A[i]`, `V[i]`, `n` , `m` 均为整数
2. 你不能将物品进行切分
3. 你所挑选的要装入背包的物品的总大小不能超过 m
4. 每个物品只能取一次

样例 1:

```
输入: m = 10, A = [2, 3, 5, 7], V = [1, 5, 2, 4]
输出: 9
解释: 装入 A[1] 和 A[3] 可以得到最大价值, V[1] + V[3] = 9 
```

样例 2:

```
输入: m = 10, A = [2, 3, 8], V = [2, 5, 8]
输出: 10
解释: 装入 A[0] 和 A[2] 可以得到最大价值, V[0] + V[2] = 10
```

`O(nm)` 空间复杂度可以通过, 不过你可以尝试 `O(m)` 空间复杂度吗?

%

- 状态：`dp[i][j]`，前 i 个物品，在容量为 j 的情况下，能装的最大价值
- 状态转移：
  - 考虑第 i 个物品“放”或者“不放”
  - 不放第 i 个物品（不放不一定是放不下，也可能是放了无法达到全局最优），`dp[i - 1][j]`
  - 放第 i 个物品，`j - A[i - 1] >= 0`，`dp[i - 1][j - A[i - 1]] + V[i - 1]`
  - `dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - A[i - 1]] + V[i - 1])`
- 初始值：
  - `dp[0][j] = 0;`，不放任何物体，价值为 0；
  - `dp[i][0] = 0;`，容量为 0 ，价值为 0；
- 输出结果：`dp[n][m]`

```cpp
class Solution {
public:
    /**
     * @param m: An integer m denotes the size of a backpack
     * @param A: Given n items with size A[i]
     * @param V: Given n items with value V[i]
     * @return: The maximum value
     */
    int backPackII(int m, vector<int> &A, vector<int> &V) {
        // write your code here
        int n = A.size();
        vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
        for (int i = 1; i <= n; ++i) {
            for (int j = 0; j <= m; ++j) {
                dp[i][j] = dp[i - 1][j];
                if (j - A[i - 1] >= 0) {
                    dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - A[i - 1]] + V[i - 1]);
                }
            }
        }
        return dp[n][m];
    }
};
```
