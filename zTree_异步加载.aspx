<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zTree_异步加载.aspx.cs" Inherits="zTree_异步加载" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/demo.css" type="text/css">
    <link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
        <script type="text/javascript" src="layer-v1.8.5/layer/layer.min.js"></script>
        <script type="text/javascript">
        
            var setting =
                { callback: {
       
                    onCheck: zTreeOnCheck},
                    async:
                    {
                        enable: true,
                        url: 'asyncData.ashx',
                        autoParam: ["id", "name"],
                        dataFilter: filter
                    },
                    check: {
                        enable: true
                    },
                    data:
                    {

                        simpleData:
                        {
                            enable: true,
                            idKey: "id",
                            pIdKey: "prId"
                        },
                        key:
                        {
                            checked: "cked"
                        }
                    }
                };
                function zTreeOnCheck(event, treeId, treeNode) {
                    var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                    var nodes = treeObj.getCheckedNodes(true);
                    for (var i = 0; i < nodes.length; i++) {
                        var halfCheck = nodes[i].getCheckStatus();
                        console.log(halfCheck);
                        if (!halfCheck.half)
                    {
                        console.log(nodes[i].id);
                    }
                        //console.log(nodes[i].prId);
                    }
                };
                function filter(treeId, parentNode, childNodes) {
                    if (!childNodes) return null;
                    for (var i = 0, l = childNodes.length; i < l; i++) {
                        if (childNodes[i].leaf == 0) {
                            //isParent = true;
                            childNodes[i].name = childNodes[i].name.replace('lyj', 'yyy');
                        }
                        else {
                           // isParent = false; 
                        childNodes[i].name = childNodes[i].name.replace('lyj', 'yyy'); }
                    }
                    return childNodes;
                };
                var zNodes = []; 
//                var zNodes = [
//{ id: 1, pId: 0, name: "parentNode 1", open: true },
//{ id: 11, pId: 1, name: "parentNode 11", isParent: true, open: true },
//{ id: 111, pId: 11, name: "leafNode 111" },
//{ id: 112, pId: 11, name: "leafNode 112" },
//{ id: 113, pId: 11, name: "leafNode 113" },
//{ id: 114, pId: 11, name: "leafNode 114" },
//{ id: 12, pId: 1, name: "parentNode 12" },
//{ id: 121, pId: 12, name: "leafNode 121" },
//{ id: 122, pId: 12, name: "leafNode 122" },
//{ id: 123, pId: 12, name: "leafNode 123" },
//{ id: 13, pId: 1, name: "parentNode 13", isParent: true },
//{ id: 2, pId: 0, name: "parentNode 2", isParent: true }
//]; 
            $(function () {
                $.fn.zTree.init($("#treeDemo"), setting, zNodes); 
            })
            
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <ul id="treeDemo" class="ztree" style="margin:0px auto"></ul>
    </div>
    </form>
</body>
</html>
