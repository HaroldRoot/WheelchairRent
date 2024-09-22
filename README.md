# Shit to Do

## 0. 流程梳理

![flow.jpg](src%2Fmain%2Fwebapp%2Fstatic%2Fimg%2Fflow.jpg)

## 1. 改变订单状态码及其解释

- 1 等待发货
- 2 等待收货
- 3 使用中
- 4 等待上门保养/维修
- 5 等待上门回收
- 0 订单结束

## 2. 取消租赁结束时间，改成用户手动结束

- 在用户没有结束租赁的时候，前端 `/myorder` 的表格查询到订单状态是 0（已结束），就在“租赁结束时间”显示数据库里的时间，否则统统显示“**尚未结束**”。
-  `/myorder` 的“操作”要添加一个“**归还**”按钮，作用是把订单状态修改成 5（等待上门回收）。
- 在 `/toDetailsPage` 页面，点击“现在租赁”，弹出“填写租赁信息”表单，“租赁时间”这一项应该改成只需要填“**开始时间**”，不再需要填“结束时间”。

## 3. 添加归还按钮

- 归还按钮让状态变成等待上门回收（5）。
- 管理员确认了才是真正的订单结束（0），然后才结算租赁结束时间。

## 4. 添加评论功能

- 数据库添加评论表。
- 用户的 `/myorder` 订单状态为 0 已结束的时候，出现评论按钮。用户对一个已结束的订单只可以添加一次评论。
- 管理员可以查看、删除评论。
- 轮椅详细信息 `/toDetailsPage?id=` 要显示当前单个轮椅有关的评论。
