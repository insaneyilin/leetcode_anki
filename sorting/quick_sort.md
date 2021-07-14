## 快速排序

%

快速排序的思想，实质上是分治法。基于一个 pivot 将数组分为两个有序子数组。这个分的过程称为 partition。

关键在于 partition 如何实现。

比如以数组的尾部作为 pivot 进行 partition 。

固定以尾部或者头部的 partition 策略有缺陷，如当所有元素都相同的情况下，partition 会一直返回尾部，递归深度 N，每次递归的 partition 又循环 N 次，时间复杂度变为 O(N^2)

```cpp
int partition(int nums[], int left, int right)
{
    // 以 nums[left] 为 pivot，将区间 [left, right] 一分为二
    int pivot = nums[left];
    while (left < right)
    {
        // 从右边开始找到比 pivot 小的元素，移到左边
        while (left < right && nums[right] >= pivot)
            --right;
        nums[left] = nums[right];
 
        // 从左边开始找到比 pivot 大的元素，移到右边
        while (left < right && nums[left] <= pivot)
            ++left;
        nums[right] = nums[left];
    }
    // 跳出 while 循环后 left == right，此时区间已经一分为二，将 nums[left] 还原
    nums[left] = pivot;
    return left;
}
 
void quick_sort(int nums[], int left, int right)
{
    if (left < right) // 也可以改写成 if (left >= right) return;
    {
        // 进行区间划分，区间 [left, mid-1] 的元素均小于 区间 [mid+1, right] 的元素
        int mid = partition(nums, left, right);
        quick_sort(nums, left, mid - 1);  // 对区间 [left, mid-1] 进行快速排序
        quick_sort(nums, mid + 1, right); // 对区间 [mid+1, right] 进行快速排序
    }
}
```
