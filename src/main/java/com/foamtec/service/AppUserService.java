package com.foamtec.service;

import com.foamtec.dao.AppUserDao;
import com.foamtec.domain.AppUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.security.Principal;
import java.util.Date;
import java.util.List;

@Service
public class AppUserService {

    private final Logger LOGGER = LoggerFactory.getLogger(AppUserService.class);

    @Autowired
    private AppUserDao appUserDao;

    public AppUser findByUsername(String username) {
        LOGGER.debug("-= Find username > {} =-", username);
        return appUserDao.findByUsername(username);
    }

    public List<AppUser> findAllAppUser() {
        LOGGER.debug("-= Find All username =-");
        return appUserDao.findAll();
    }

    public AppUser findById(Long id) {
        return appUserDao.findById(id);
    }

    public void create(MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
        Principal principal = multipartHttpServletRequest.getUserPrincipal();
        AppUser appUser = appUserDao.findByUsername(principal.getName());
        if(!appUser.getRoleName().equals("admin")) {
            throw new Exception("not admin");
        }
        String employeeID = multipartHttpServletRequest.getParameter("employeeID");
        String username = multipartHttpServletRequest.getParameter("username");
        String password = multipartHttpServletRequest.getParameter("password");
        String name = multipartHttpServletRequest.getParameter("name");
        String sex = multipartHttpServletRequest.getParameter("sex");
        String department = multipartHttpServletRequest.getParameter("department");
        String shift = multipartHttpServletRequest.getParameter("shift");
        String phoneNumber = multipartHttpServletRequest.getParameter("phoneNumber");
        String roleName = multipartHttpServletRequest.getParameter("roleName");

        AppUser employee = new AppUser();
        employee.setCreateBy(appUser.getName());
        employee.setCreateDate(new Date());
        employee.setEmployeeID(employeeID);
        employee.setUsername(username);
        employee.setPassword(password);
        employee.setName(name);
        employee.setSex(sex);
        employee.setEnabled(1);
        employee.setDepartment(department);
        employee.setShift(shift);
        employee.setPhoneNumber(phoneNumber);
        employee.setRoleName(roleName);
        appUserDao.create(employee);
    }

    public void update(MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
        Principal principal = multipartHttpServletRequest.getUserPrincipal();
        AppUser appUser = appUserDao.findByUsername(principal.getName());
        if(!appUser.getRoleName().equals("admin")) {
            throw new Exception("not admin");
        }
        Long id = Long.parseLong(multipartHttpServletRequest.getParameter("id"));
        String employeeID = multipartHttpServletRequest.getParameter("employeeID");
        String username = multipartHttpServletRequest.getParameter("username");
        String password = multipartHttpServletRequest.getParameter("password");
        String name = multipartHttpServletRequest.getParameter("name");
        String sex = multipartHttpServletRequest.getParameter("sex");
        String department = multipartHttpServletRequest.getParameter("department");
        String shift = multipartHttpServletRequest.getParameter("shift");
        String phoneNumber = multipartHttpServletRequest.getParameter("phoneNumber");
        String roleName = multipartHttpServletRequest.getParameter("roleName");

        AppUser employee = appUserDao.findById(id);
        employee.setUpdateBy(appUser.getName());
        employee.setUpdateDate(new Date());
        employee.setEmployeeID(employeeID);
        employee.setUsername(username);
        employee.setPassword(password);
        employee.setName(name);
        employee.setSex(sex);
        employee.setEnabled(1);
        employee.setDepartment(department);
        employee.setShift(shift);
        employee.setPhoneNumber(phoneNumber);
        employee.setRoleName(roleName);
        appUserDao.update(employee);
    }

    public void updateProfile(MultipartHttpServletRequest multipartHttpServletRequest) {
        Principal principal = multipartHttpServletRequest.getUserPrincipal();
        AppUser appUser = appUserDao.findByUsername(principal.getName());
        Long id = Long.parseLong(multipartHttpServletRequest.getParameter("id"));
        String username = multipartHttpServletRequest.getParameter("username");
        String password = multipartHttpServletRequest.getParameter("password");
        String name = multipartHttpServletRequest.getParameter("name");
        String sex = multipartHttpServletRequest.getParameter("sex");
        String phoneNumber = multipartHttpServletRequest.getParameter("phoneNumber");

        AppUser employee = appUserDao.findById(id);
        employee.setUpdateBy(appUser.getName());
        employee.setUpdateDate(new Date());
        employee.setUsername(username);
        employee.setPassword(password);
        employee.setName(name);
        employee.setSex(sex);
        employee.setEnabled(1);
        employee.setPhoneNumber(phoneNumber);
        appUserDao.update(employee);
    }
}
