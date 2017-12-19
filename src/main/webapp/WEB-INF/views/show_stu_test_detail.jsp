<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>试卷管理列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/lay/modules/laypage.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>
<div style=" margin: 40px auto 6px 0px;" >
    <form class="layui-form layui-form-pane" action="" method="post">
        <div class="site-tips">
            试卷名：<span style="font-size: 20px" id="stuTestName"></span>&nbsp;&nbsp;&nbsp;&nbsp;
            姓名：<span style="font-size: 20px" id="stuName"></span>
        </div>
        <div id="itemArea" style="margin-left: 10px">

        </div>
        <div class="layui-form-item">
            <input type="button" id="submitTest" class="layui-btn " value="提交，批改下一份">
            <button class="layui-btn "   type="reset" >重置</button>
        </div>
    </form>
</div>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="/lib/jquery-1.8.3.js"></script>
<script>
    layui.use(['laypage', 'layer','laydate','jquery','form','layedit'],function() {
        var laydate = layui.laydate;
        var laypage = layui.laypage;
        var form = layui.form();
        var $ = layui.jquery;
        var layedit = layui.layedit;
        layedit.build('codeItemSiLu'); //建立编辑器
        layedit.build('codeItemAnswer'); //建立编辑器
        var start = {
            max : '2099-06-16 23:59:59',
            istoday : false,
            choose : function(datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };

        var end = {
            max : '2099-06-16 23:59:59',
            istoday : false,
            choose : function(datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };


        //页面初始化的时候加载分页数据
        $(function(){
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/rest/test/piyueTest?classId=${param.classId}&testId=${param.testId}&stuId=${param.stuId}",
                //记得加双引号  T_T
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#stuTestName").html(data.testSourceInfo.testName);
                    $("#stuName").html(data.student.username);
                    $("#stuName").attr("stuId",data.student.id);
                    var answerInfos = data.answerInfoList;
                    if(answerInfos && answerInfos.length>0) {
                        var count = 1;
                        for(var i = 0;i<answerInfos.length;i++){
                            //根据itemId查询 item信息
                           var itemId =  answerInfos[i].itemId;
                            $.ajax({
                                type: "GET",
                                url: "${pageContext.request.contextPath}/rest/item/getItemInfoByItemId?itemId="+itemId,
                                //记得加双引号  T_T
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                async:false,
                                success: function (data) {
                                    //创建编程题
                                    if(data.itemType == '1') {
                                        createCodeItem(data,count,answerInfos[i]);
                                        count++;
                                    }
                                }
                            });
                        }
                    }

                },
                error: function (err) {
                    alert(err + "err");
                }
            });

        })

        //创建编程题
        function createCodeItem(items,count,answer) {
            console.log(items);
            var _div = $("<div class='itemAnswerArea'   id="+items.id+" >\n" +
                "            <div class=\"site-title\">\n" +
                "                <fieldset><legend><a >第"+count+"题("+items.itemScore+"分)</a></legend></fieldset>\n" +
                "            </div>\n" +
                "            <div class=\"site-item\">\n" +
                "               "+ items.itemContent+"\n" +
                "            </div>\n" +
                "            <div>\n" +
                "\n" +
                "                <div class=\"layui-form-item layui-form-text\">\n" +
                "                    <label class=\"layui-form-label\">请在写下你的做题思路（步骤）：</label>\n" +
                "                    <div class=\"layui-input-block\">\n" +
                "                        <textarea placeholder=\"请输入思路\"  class=\"layui-textarea silu\">"+answer.silu+"</textarea>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "            <div>\n" +
                "\n" +
                "                <div class=\"layui-form-item layui-form-text\">\n" +
                "                    <label class=\"layui-form-label\">请将你的答案粘贴到下边的文本域中：</label>\n" +
                "                    <div class=\"layui-input-block\">\n" +
                "                        <textarea placeholder=\"请输入答案\" class=\"layui-textarea answer\">"+answer.answer+"</textarea>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>")
            var scoreSpan = $(" <div class=\"layui-form-item\">\n" +
                "    <label class=\"layui-form-label\">综合评分：</label>\n" +
                "    <div class=\"layui-input-inline\">\n" +
                "      <input type=\"number\" name=\"itemScore\" lay-verify=\"required\" placeholder=\"请输入分值\" autocomplete=\"off\" class=\"layui-input\">\n" +
                "    </div>\n" +
                "  </div>")
            _div.appendTo($("#itemArea"));
            scoreSpan.appendTo(_div);
        }


        $(function () {
            $("#submitTest").click(function () {
                //获取提交的答案信息
                alert(123);
                var _divs=$(".itemAnswerArea");
                var scoreInfos = new Array();
                //封装答案信息
                var stuId =  $("#stuName").attr("stuId");
                if(_divs){
                    _divs.each(function () {
                        var itemId = $(this).attr('id');
                        var itemScore = $(_divs.get(0)).find('input')[0].value;
                        var scoreInfo = {};
                        scoreInfo.stuId=stuId;
                        scoreInfo.itemId=itemId;
                        scoreInfo.itemScore=itemScore;
                        scoreInfos.push(scoreInfo);
                        console.log(scoreInfos);
                    })
                }
                console.log(scoreInfos);
              //  itemAnswersInfo = JSON.serialize(itemAnswersInfo);
                scoreInfos = JSON.stringify(scoreInfos);
                $.post("${pageContext.request.contextPath}/rest/score/submitScoreInfo",{scoreInfos:scoreInfos},function (result) {
                    if(result.result){
                        alert("批改成功");
                    }

                });
            })
        })


    });


</script>
</body>
</html>
