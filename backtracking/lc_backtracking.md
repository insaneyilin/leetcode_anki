## 回溯法

%

一般“搜索”题会使用回溯法。

把多维度的数据（状态）看成一个多维状态向量（solution vector），然后用循环依次穷举各个维度的值，得到所有可能的结果(即 solution space)，在循环过程中避免列举出不正确的数据。

回溯法伪代码：

```cpp
backtrack( [v[1], ..., v[n]] )
{
    // 判断当前数据是否正确
    if ( [v[1], ..., v[n]] is a well-generated ) 
    {
        if ( [v[1], ..., v[n]] is a solution )
        {
            process solution;
            return;
        }
    }

    // 穷举并处理下一个维度
    for ( x = possible values of v[n+1] )
    {
        backtrack( [v[1], ..., v[n], x] );
    }
}
```

回溯法可以结合剪枝以及分支定界来实现。

结合剪枝（pruning）的回溯法伪代码：

```cpp
int solution[MAX_DIMENSION];
 
void backtrack(int dimension)
{
    /* pruning: 在迭代中避免列举出不正确的数据 */
    if (solution[] will NOT be a solution in the future) 
        return;
 
    if (solution[] is well - generated)
    {
        check and record solution;
        return;
    }
 
    for (x = each value of current dimension)
    {
        solution[dimension] = x;
        backtrack(dimension + 1);
    }
}
```
