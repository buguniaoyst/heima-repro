var navs = [{
	"title": "用户管理",
	"icon": "&#xe614;",
	"spread": true,
	"children": [{
        "title": "新增用户",
        "icon": "&#xe612;",
        "href": "/rest/user_control"
    }, {
        "title": "用户列表",
        "icon": "&#xe613;",
        "href": "/rest/userctrl_List"
    }]
},{
	"title": "考试管理",
	"icon": "&#xe620;",
	"spread": false,
	"children": [ {
        "title": "组卷管理",
        "icon": "&#xe654;",
        "href": "/rest/test_control"
    }, {
        "title": "组卷列表",
        "icon": "&#xe615;",
        "href": "/rest/testctrl_list"
    }]
},{
    "title": "试卷资源",
    "icon": "&#xe61d;",
    "spread": false,
    "children": [{
        "title": "JavaEE基础班开班考试试卷",
        "icon": "&#xe63c;",
        "href": "/rest/primary_test"
    }, {
        "title": "JavaEE就业阶段开班考试试卷",
        "icon": "&#xe63c;",
        "href": "/rest/senior_test"
    }]
}, {
	"title": "成绩管理",
	"icon": "&#xe629;",
	"href": "",
	"spread": false,
	"children": [  {
		"title": "开班考试成绩",
		"icon": "&#xe60a;",
		"href": "/rest/testctrl_scoreList"
	},{
        "title": "课后测试成绩",
        "icon": "&#xe60a;",
        "href": "/rest/testctrl_scoreList"
    }]
}, {
    "title": "带班经验沉淀",
    "icon": "&#xe642;",
    "href": "",
    "spread": false,
    "children": [  {
        "title": "经验留存",
        "icon": "&#xe60a;",
        "href": "/rest/study_add"
    }, {
        "title": "经验宝库",
        "icon": "&#xe60a;",
        "href": "/rest/testctrl_scoreList"
    }]
}, {
    "title": "随堂测试",
    "icon": "&#xe629;",
    "href": "",
    "spread": false,
    "children": [  {
        "title": "新增题目",
        "icon": "&#xe60a;",
        "href": "/rest/item_add"
    }, {
        "title": "题库列表",
        "icon": "&#xe60a;",
        "href": "/rest/item_list"
    }, {
        "title": "组卷管理",
        "icon": "&#xe60a;",
        "href": "/rest/item_test_add"
    }, {
        "title": "随堂试卷列表",
        "icon": "&#xe60a;",
        "href": "/rest/test_source_list"
    }, {
        "title": "安排测试",
        "icon": "&#xe60a;",
        "href": "/rest/item_test_create"
    }, {
        "title": "测试结果",
        "icon": "&#xe60a;",
        "href": "/rest/item_test_answer_list"
    }]
}, {
	"title": "其他",
	"icon": "&#xe650;",
	"href": "#",
	"spread": false,
	"children": [{
		"title": "通讯录",
		"icon": "&#xe613;",
		"href": "/rest/score_list"
	}]
}];