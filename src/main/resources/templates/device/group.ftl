<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> ${systemInfo.projectName } | 设备分配 </title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/jQueryUI/jquery-ui.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/plugins/datatables/buttons.bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/datatables/select.dataTables.min.css">
    <link rel="stylesheet" href="/plugins/datatables/select.bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger-theme-air.css">
    <link rel="stylesheet" href="/plugins/bootstrap-treeview/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/css/efence.css">

    <link rel="stylesheet" href="/plugins/zTree-v3/css/metroStyle/metroStyle.css">

    <#--<link rel="stylesheet" href="/plugins/daterangepicker/demo.css">-->
  <#--  <link rel="stylesheet" href="/plugins/daterangepicker/zTreeStyle.css">-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<#-- Site wrapper -->
<div class="wrapper">
<#-- load header bar -->
<#include "../comm/headerBar.ftl">
<#-- load left side menus sidebar -->
<#include "../comm/sideMenu.ftl">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                设备分配
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active"><a href="###"> 设备管理</a></li>
                <li class="active">设备分配</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">用户</h3>
                        </div>
                        <div class="box-body " >
                           <table id="users-table" class="table table-hover">
                               <thead><tr><th></th></tr></thead>
                           </table>
                        </div>
                    </div>
                 </div>
                <#--<div class="col-md-9">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">站点分配信息</h3>
                        </div>
                        <div class="box-body" style="min-height: 820px">
                            <div id="devices-tree"></div>
                        </div>
                    </div>
                 </div>-->
                <div class="col-md-9" id="site-dlg">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">站点分配信息</h3>
                        </div>
                        <div class="box-body" style="min-height: 820px">
                            <div id="devices-tree" class="ztree"></div>
                        </div>
                       <#-- <div class="modal-body" style="width: 300px;height: 417px;overflow-y: scroll;">
                            <div id="treeDemo" class="ztree"></div>
                        </div>
                        -->
                    </div>
                </div>
             </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

<#-- load footer bar -->
<#include "../comm/footer.ftl">

</div>
<#-- ./wrapper -->

<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/plugins/jquery-idleTimeout/store.min.js"></script>
<script src="/plugins/jquery-idleTimeout/jquery-idleTimeout.min.js"></script>
<script src="/plugins/sockjs/sockjs.min.js"></script>
<script src="/js/notifyHandle.js"></script>
<script src="/plugins/fastclick/fastclick.js"></script>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/plugins/datatables/dataTables.buttons.min.js"></script>
<script src="/plugins/datatables/buttons.bootstrap.min.js"></script>
<script src="/plugins/datatables/dataTables.select.js"></script>
<script src="/plugins/messenger/messenger.js"></script>
<script src="/plugins/bootbox/bootbox.min.js"></script>
<script src="/plugins/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<script src="/js/efence.js"></script>
<script src="/plugins/zTree-v3/js/jquery.ztree.all.js"></script>
<script src="/js/page/group.js"></script>

<#--<script src="/plugins/daterangepicker/jquery.ztree.core.js"></script>-->
<#--<script src="/plugins/daterangepicker/jquery.ztree.excheck.js"></script>-->
<#--<script src="/plugins/daterangepicker/moment.min.js"></script>-->
<#--<script src="/plugins/daterangepicker/daterangepicker.js"></script>-->


<script src="/plugins/select2/select2.full.min.js"></script>
<script src="/plugins/select2/i18n/zh-CN.js"></script>

</body>
</html>
