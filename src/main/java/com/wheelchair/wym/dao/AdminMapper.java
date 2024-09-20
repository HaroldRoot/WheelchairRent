package com.wheelchair.wym.dao;

import com.wheelchair.wym.entity.*;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper {

    // 管理员登录
    Admin adminAccess(Admin admin);

    // 查询所有用户
    List<Users> findAllUser();

    // 查询所有轮椅信息
    List<Wheelchair> findAllWheelchair(Page page);

    // 管理员删除轮椅信息
    int deleteWheelchair(int hID);

    // 通过id查询用户
    Users findUserById(int uID);

    // 管理员更新普通用户信息
    int updateUser(Users users);

    // 管理员删除用户
    int deleteUser(int uID);

    // 检查修改密码原密码
    Admin checkAdminPwd(Admin admin);

    // 修改管理员密码
    int updateAdminPwd(Admin admin);

    // 查询所有订单
    List<UserOrder> findAllOrder(Page page);

    // 查询所有维修订单
    List<RepairOrder> findAllRepairOrder(Page page);

    // 查询所有配送订单
    List<DeliveryOrder> findAllDeliveryOrder(Page page);

    // 确认维修订单
    int confirmRepairOrder(int id);

    // 查询用户男女数量
    @MapKey("u_gender") // 将结果映射为以性别为键的Map
    Map<String, Integer> countGender();
}
