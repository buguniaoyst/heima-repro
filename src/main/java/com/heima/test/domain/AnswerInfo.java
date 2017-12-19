package com.heima.test.domain;

import javax.persistence.*;

@Entity
@Table(name = "answer_info")
public class AnswerInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;//答案实体类主键id
    private Integer stuId;//学员id
    private String classId;//班级id
    private Integer itemId;//题目id
    private  String silu;//做题思路
    private  String answer;//答案
    private String testId;
    private String stuName;

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getSilu() {
        return silu;
    }

    public void setSilu(String silu) {
        this.silu = silu;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "AnswerInfo{" +
                "id=" + id +
                ", stuId=" + stuId +
                ", classId='" + classId + '\'' +
                ", itemId=" + itemId +
                ", silu='" + silu + '\'' +
                ", answer='" + answer + '\'' +
                ", testId='" + testId + '\'' +
                ", stuName='" + stuName + '\'' +
                '}';
    }
}
