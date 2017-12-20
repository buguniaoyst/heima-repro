package com.heima.test.web;

import com.heima.test.domain.*;
import com.heima.test.service.*;
import com.heima.test.utils.CommonUtils;
import com.heima.test.utils.ScoreUtils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("records")
public class TestRecordsController {



    @Autowired
    private TestRecordsService testRecordsService;




    @RequestMapping(value = "scoreList")
    @ResponseBody
    public Map<String, Object> getFinishedTest(HttpSession session, HttpServletRequest request){
//        TestCtrl testCtrl = new TestCtrl();
//        testCtrl.setTestStatus("已关闭");
//        List<TestCtrl> testCtrlList = testRecordsService.queryFinishedTestByExample(testCtrl);
//        Map<String, Object> resultMap = new HashMap<String, Object>();
//        resultMap.put("pagesize", 10);
//        resultMap.put("results", testCtrlList);
    	
    	//获取用户登陆用户
    	 User user = (User) session.getAttribute("loginUser");
       Map<String, Object> resultMap = new HashMap<String, Object>();
    	 if (user!=null) {
    		  List<TestRecords>	 lists=testRecordsService.findRecordsByExample(user.getId());
    		  if (lists!=null) {
    			  resultMap.put("pagesize", lists.size());
     	         resultMap.put("results", lists);
			}
    	 }
    
        return resultMap;
    }

    @RequestMapping(value = "showDetailAll")
    @ResponseBody
    public List<Map> showScoreDetail(Integer stuId,Integer testId,HttpSession session, HttpServletRequest request){
    	
    	 User user = (User) session.getAttribute("loginUser");
    	 
    	 if (user!=null) {
    		 Integer id = user.getId();
    		 if (id.equals(stuId)) {
    			 
    			List<Map> setails=testRecordsService.showDetailAll(stuId,testId);
    			 
				return setails;
			}
		}else{
			
			
			return null;
		}
    	
//        TestInfo testInfo = new TestInfo();
//        testInfo.setTestid(testCtrl.getTestId());
//        List<TestInfo> testInfoList = testInfoService.queryListByExample(testInfo);
//        Map<String, Object> resultMap = new HashMap<String, Object>();
//        resultMap.put("pagesize", 50);
//        resultMap.put("results", testInfoList);
//        return resultMap;
    	return null;
    }



}
