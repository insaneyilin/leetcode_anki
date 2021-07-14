## 二分查找

考察点：

- 有序集合
- 终止条件：
  - 找到要查找的元素
  - 区间缩小为 0

模板：

- 初始化：`left = 0; right = n - 1;`
- mid 的取值：`mid = left + (right - left) / 2;`，或者 `mid = left + ((right - left)>>1)`；
- 比较 mid 和 目标值，分别考虑 `==` , `>`, `<`；
- 边界更新：`left = mid + 1; right = mid - 1;` （有时候根据题目要求会略有变化）
- 循环条件：`while (left <= right)`

关于二分查找的模板有一些变种，可以参考 LeetBook 里的内容：

https://leetcode-cn.com/leetbook/read/binary-search/xewjg7/
