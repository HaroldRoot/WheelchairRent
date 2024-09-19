package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.*;

import java.util.List;


public interface IOrderService {
    /**
     * 添加订单信息
     */
    int addOrder(Order order);

    /**
     * 自动生成配送订单
     */
    int addDeliveryOrder(DeliveryOrder deliveryOrder);

    /**
     * 查询所有订单信息
     */
    List<UserOrder> findAllOrder(Page page);

    /**
     * 查询单个用户所有订单
     */
    int getOrderCount(int uID);

    /**
     * 删除用户订单
     */
    int deleteOrder(int oID);

    /**
     * 申请维修或保养订单
     *
     * @param repairOrder 维修/保养订单对象
     * @return 操作结果
     */
    String applyRepairOrder(RepairOrder repairOrder);

    /**
     * 管理员删除保养/维修订单
     * @param id
     * @return
     */
    int deleteRepairOrder(int id);
}
