## 归并排序

%

分治思想。

归并排序的执行效率与要排序的原始数组的有序程度无关，所以其时间复杂度是非常稳定的，不管是最好情况、最坏情况，还是平均情况，时间复杂度都是 O(nlogn)。

归并，就是将两个或两个以上的有序序列，合并成一个有序序列。

```cpp
// vec[] : 待排序数组
// tmp[] : 与 a 等长的辅助数组
// [left, mid] 是第一个有序序列
// [mid + 1, right] 是第二个有序序列
void merge(std::vector<int> &vec, std::vector<int> &tmp, int left, int mid, int right) {
    tmp = vec;  // 拷贝原数组
    int i1 = left;
    int i2 = mid + 1;
    int k = left;
    for (; i1 <= mid && i2 <= right; ++k) {
        // 合并有序序列，选小的元素依次 append
        if (tmp[i1] < tmp[i2]) {
            vec[k] = tmp[i1++];
        } else {
            vec[k] = tmp[i2++];
        }
    }
    // 拷贝第一个序列剩下的部分
    while (i1 <= mid) {
        vec[k++] = tmp[i1++];
    }
    // 拷贝第二个序列剩下的部分
    while (i2 <= right) {
        vec[k++] = tmp[i2++];
    }
}

void merge_sort(std::vector<int> &vec, std::vector<int> &tmp, int left, int right) {
    // 至多只有一个元素，不用排序
    if (left >= right) {
        return;
    }
    int mid = left + (right - left) / 2;
    // 注意上面的约定：[left, mid] 是第一个有序序列
    // [mid + 1, right] 是第二个有序序列
    // 这里有个易错细节，一定要按照 mid 作为中间元素来划分两个有序子数组（可以考虑数组长度为偶数的情况），
    // 即划分后的子数组要“平衡”
    // 否则会由于不平衡导致陷入死循环
    merge_sort(vec, tmp, left, mid);
    merge_sort(vec, tmp, mid + 1, right);
    merge(vec, tmp, left, mid, right);
}
```
