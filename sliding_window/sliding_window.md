## 滑动窗口

https://leetcode-cn.com/problems/permutation-in-string/solution/wo-xie-liao-yi-shou-shi-ba-suo-you-hua-dong-chuang/

和双指针题目类似，更像双指针的升级版，滑动窗口核心点是维护一个窗口集，根据窗口集来进行处理。

%

基本思路：

```cpp
int left = 0, right = 0;

while (right < s.size()) {`
    // 增大窗口
    window.add(s[right]);
    right++;
    
    while (window needs shrink) {
        // 缩小窗口
        window.remove(s[left]);
        left++;
    }
}
```

各种细节问题：

- 如何向窗口中添加新元素
- 如何缩小窗口
- 在窗口滑动的哪个阶段更新结果

滑动窗口框架：

```cpp
/* 滑动窗口算法框架 */
void slidingWindow(string s, string t) {
    unordered_map<char, int> need;
    unordered_map<char, int> window;  // window 保存 s 的滑动窗口中的信息
    // need 保存模式串 t 的信息
    for (char c : t) {
      need[c]++;
    }

    int left = 0;
    int right = 0;
    int valid = 0;
    while (right < s.size()) {
        // c 是将移入窗口的字符
        char c = s[right];
        // 右移窗口
        right++;
        // (***) 进行窗口内数据的一系列更新
        ...

        /*** debug 输出的位置 ***/
        printf("window: [%d, %d)\n", left, right);
        /********************/
        
        // 判断左侧窗口是否要收缩
        while (window needs shrink) {
            // d 是将移出窗口的字符
            char d = s[left];
            // 左移窗口
            left++;
            // (***) 进行窗口内数据的一系列更新
            ...
        }
    }
}
```

两个 `(***)` 处的操作分别是右移和左移窗口更新操作，它们的操作是对称的。

滑动窗口算法的思路：

1. 在字符串 `S` 中使用双指针中的左右指针技巧，初始化 `left = right = 0` ，把索引左闭右开区间 `[left, right)` 称为一个「窗口」；
2. 先不断地增加 `right` 指针扩大窗口 `[left, right)` ，直到窗口中的字符串符合要求；
3. 此时，我们停止增加 `right` ，转而不断增加 `left` 指针缩小窗口 `[left, right)` ，直到窗口中的字符串不再符合要求；同时，每次增加 `left` ，我们都要更新一轮结果；
4. 重复第 2 和第 3 步，直到 `right` 到达字符串 `S` 的尽头。

**第 2 步相当于在寻找一个「可行解」，然后第 3 步在优化这个「可行解」，最终找到最优解**。

左右指针轮流前进，窗口大小增增减减，窗口不断向右滑动，这就是「滑动窗口」这个名字的来历。

[#sliding_window]()
