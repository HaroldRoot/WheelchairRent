package com.wheelchair.wym.service;

import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.UserOrder;

import java.util.List;


public interface IOrderService {
    /**
     * 添加订单信息
     */
    int addOrder(Order order);

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
}
