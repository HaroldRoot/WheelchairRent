package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.Order;
import com.wheelchair.wym.entity.Page;
import com.wheelchair.wym.entity.UserOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    /**
     * 添加房屋订单
     */
    int addOrder(Order order);

    /**
     * 查询所有订单信息
     */
    List<UserOrder> findAllOrder(Page page);

    /**
     * 查询所有订单数
     */
    int getOrderCount(int uID);

    /**
     * 删除用户订单
     */
    int deleteOrder(int oID);

}
