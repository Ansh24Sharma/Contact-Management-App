package com.yash.capp.test;

import com.yash.capp.config.SpringRootConfig;
import com.yash.capp.dao.UserDAO;
import com.yash.capp.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class TestUserDAOFindByProp {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        UserDAO userDAO=ctx.getBean(UserDAO.class);

        //List<User> users = userDAO.findByProperty("userId", 1);
        //List<User> users = userDAO.findByProperty("name", "Vikram");
        List<User> users = userDAO.findByProperty("role", 2);
        for (User u : users) {
            System.out.println(u.getUserId()+" "+u.getName()+" "+u.getRole());
            //TODO: access other columns
        }

    }
}