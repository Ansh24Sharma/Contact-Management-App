package com.yash.capp.test;

import com.yash.capp.config.SpringRootConfig;
import com.yash.capp.domain.User;
import com.yash.capp.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserServiceRegister {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserService userService=ctx.getBean(UserService.class);
        //TODO: the user details will be taken from User-Reg-Form
        User u=new User();
        u.setName("John");
        u.setPhone("55555555");
        u.setEmail("john@yash.com");
        u.setAddress("Canada");
        u.setLoginName("john");
        u.setPassword("john123");
        u.setRole(UserService.ROLE_ADMIN);
        u.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE);
        userService.register(u);
        System.out.println("--------User Registered Successfully------");
    }
}