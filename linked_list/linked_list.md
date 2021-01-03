## 链表

考察点：

- null 异常处理
- dummy head node（什么时候使用？当头节点不确定，或可能被修改的时候）
- 快慢指针
- 链表的插入、删除
- 反转链表
- 合并两个链表

%

一些常用的操作。

```cpp
// cut(l, n)，将链表 l 切掉前 n 个节点，并返回后半部分的链表头。
// 从 head 节点开始 cut n 个节点，返回 cut 部分之后的第一个节点
ListNode *cut(ListNode *head, int n) {
    auto p = head;
    while (--n && p) {
        p = p->next;
    }
    // 这里第一次写的时候没有判断 p 指针是否为空
    if (p == nullptr) {
        return nullptr;
    }
    ListNode *next = p->next;
    p->next = nullptr;  // 断开
    return next;
}
```

[#linked_list]()
