<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" href="css/demo.css" type="text/css">

	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style>
        .ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(Image/1.ico) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle;padding:4px}  
.ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(Image/1.ico) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.icon02_ico_docu{margin-right:2px; background: url(img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.icon03_ico_docu{margin-right:2px; background: url(img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.icon04_ico_docu{margin-right:2px; background: url(img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.icon05_ico_docu{margin-right:2px; background: url(img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}  
.ztree li span.button.icon06_ico_docu{margin-right:2px; background: url(img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle} 
    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="layer-v1.8.5/layer/layer.min.js"></script>
    <script>
        var setting = {
        callback: {
            onCheck: zTreeOnCheck,
            onClick: treenodeClick
	           },
            check: {
                enable: true
            },
            data: {
              key:
                {
               checked:"cked"
                },
                simpleData: {
                    enable: true,
                    idKey: "id",
			        pIdKey: "prId"
                           }
            }
        };
function treenodeClick(event, treeId, treeNode, clickFlag) {
    //此处treeNode 为当前节点
    var str = '';
    str = getAllChildrenNodes(treeNode, str);
    alert(str); //所有叶子节点ID
}
function getAllChildrenNodes(treeNode, result) {
    if (treeNode.isParent) {
        var childrenNodes = treeNode.children;
        if (childrenNodes) {

            for (var i = 0; i < childrenNodes.length; i++) {
                //alert(childrenNodes.length);
                result +=  childrenNodes[i].name+ ',';
                result = getAllChildrenNodes(childrenNodes[i], result);
         
            }
        }
    }
    return result;
}

 function zTreeOnCheck(event, treeId, treeNode) {
    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var nodes = treeObj.getCheckedNodes(true);
    for (var i = 0; i < nodes.length; i++) {
        alert(nodes[i].id);
        alert(nodes[i].prId);
    }
};

var zNodes;
var i;
$(function () {

    $("#Button2").click(function () {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getNodes();
        alert(nodes[0].children[0].id);

    });
    $("#Button3").click(function () {
        layer.close(i);

    });
    $("#Button4").click(function () {
        $.layer({
            type: 1,
            shade: [0.5, '#000'],
            area: ['300', '400'],
            title: false,
            border: [0],
            page: { dom: '.layer_notice' }
        });
    })
     ;
    $("#Button1").click(function () {
        i = $.layer({
            type: 1,
            title: false,
            fix: false,
            btns: 0,
            shade: [0.5, '#000'],
            closeBtn: [0, false],
            offset: ['50px', ''],
            area: ['300', '400'],
            page: { dom: '#div1' },
            end: function () {
                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                var nodes = treeObj.getCheckedNodes(true);
                for (var i = 0; i < nodes.length; i++) {
                    alert(nodes[i].id);
                }
            }
        });
    });
    $.ajax({
        async: false,
        cache: false,
        type: 'POST',
        dataType: "json",
        url: "Handler.ashx",
        error: function () {
            alert('请求失败');
        },
        success: function (data) {
            zNodes = data;
        }
    });
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
});
    </script>
</head>
<body style=" font-family: 3 of 9 Barcode">
    <form id="form1" runat="server">
    <div id="div2">
    <div class="zTreeDemoBackground left" id="div1" style="display:none">
		<ul id="treeDemo" class="ztree" style="margin:0px auto"></ul>
          <input id="Button2" type="button" value="确定" />
           <input id="Button3" type="button" value="取消" />
	</div>
        
    </div>
    <span style=" font-family:3 of 9 Barcode">*123*</span>
    <input id="Button1" type="button" value="tree" />
        <input id="Button4" type="button" value="layer" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
    <div class="layer_notice" style="width:100px;height:100px">11111
    </div>
</body>
</html>
