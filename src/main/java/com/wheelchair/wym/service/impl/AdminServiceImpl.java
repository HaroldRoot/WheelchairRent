package com.wheelchair.wym.service.impl;


import com.wheelchair.wym.dao.AdminMapper;
import com.wheelchair.wym.entity.*;
import com.wheelchair.wym.service.IAdminService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class AdminServiceImpl implements IAdminService {

    private final AdminMapper service;

    public AdminServiceImpl(AdminMapper service) {
        this.service = service;
    }

    @Override
    public Admin adminAccess(Admin admin) {
        return service.adminAccess(admin);
    }

    @Override
    public List<Users> findAllUser() {
        return service.findAllUser();
    }

    @Override
    public List<Wheelchair> findAllWheelchair(Page page) {
        return service.findAllWheelchair(page);
    }

    @Override
    public int deleteWheelchair(int hID) {
        return service.deleteWheelchair(hID);
    }

    @Override
    public Users findUserById(int uID) {
        return service.findUserById(uID);
    }

    @Override
    public int updateUser(Users users) {
        return service.updateUser(users);
    }

    @Override
    public int deleteUser(int uID) {
        return service.deleteUser(uID);
    }

    @Override
    public Admin checkAdminPwd(Admin admin) {
        return service.checkAdminPwd(admin);
    }

    @Override
    public int updateAdminPwd(Admin admin) {
        return service.updateAdminPwd(admin);
    }

    @Override
    public List<UserOrder> findOrderByCondition(String uPhone, String chairNo, Page page) {
        Map<String, Object> params = new HashMap<>();
        params.put("uPhone", uPhone);
        params.put("chairNo", chairNo);
        params.put("page", page.getPage());
        params.put("limit", page.getLimit());

        return service.findOrderByCondition(params);
    }

    @Override
    public List<RepairOrder> findAllRepairOrder(Page page) {
        return service.findAllRepairOrder(page);
    }

    @Override
    public List<DeliveryOrder> findAllDeliveryOrder(Page page) {
        return service.findAllDeliveryOrder(page);
    }

    @Override
    public int confirmRepairOrder(int id, int status) {
        return service.confirmRepairOrder(id,status);
    }

    @Override
    public Map<String, Map<String, Object>> countGender() {
        return service.countGender();
    }

    @Override
    public Map<String, Map<String, Object>> countAgeGroups() {
        return service.countAgeGroups();
    }

    @Override
    public List<Chair> findAllChairByCondition(Page p, String chairNo, Integer status) {
        return service.findAllChair(p, chairNo, status);
    }

    @Override
    public int getChairCountByCondition(String chairNo, Integer status) {
        return service.getChairCount(chairNo, status);
    }

    @Override
    public int getUserCount() {
        return service.getUserCount();
    }

    @Override
    public int getWheelchairCount() {
        return service.getWheelchairCount();
    }

    @Override
    public int getOrderCountByCondition(String uPhone, String chairNo) {
        return service.getOrderCountByCondition(uPhone, chairNo);
    }

    @Override
    public int getDeliveryOrderCount() {
        return service.getDeliveryOrderCount();
    }

    @Override
    public int getRepairOrderCount() {
        return service.getRepairOrderCount();
    }
}
