package com.heima.test.web;

import com.heima.test.domain.User;
import com.heima.test.utils.CommonUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PageController {

    // 通用页面跳转逻辑实现
    @RequestMapping("{pageName}")
    public String toPage(@PathVariable("pageName") String pageName, HttpSession session, HttpServletRequest request) {


            User user = (User) session.getAttribute("loginUser");
            if(null != user && "管理员".equals(user.getUsertype())){
                return "index";
            }else if(user == null){
                return "login";
            }

        return pageName;
    }

    @RequestMapping("/student/{pageName}")
    public String toStudentPage(@PathVariable("pageName") String pageName, HttpSession session, HttpServletRequest request) {


            User user = (User) session.getAttribute("loginUser");
            if(null != user && "管理员".equals(user.getUsertype())){
                return "index";
            }else if(null == user){
                return "login";
            }

        return "student/"+pageName;
    }

}