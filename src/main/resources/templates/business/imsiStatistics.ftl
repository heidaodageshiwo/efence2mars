<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> ${systemInfo.projectName } | 上号统计</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/jQueryUI/jquery-ui.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/select2/select2.min.css">
    <link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/plugins/datatables/buttons.bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger-theme-air.css">
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/css/efence.css">

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
                上号统计
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><span> 数据分析</span></li>
                <li class="active">上号统计</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">统计任务列表</h3>
                        </div>
                        <div class="box-body">
                            <table id="statistics-task-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>统计名称</th>
                                    <th>类型</th>
                                    <th>单位</th>
                                    <th>时间范围</th>
                                    <th>创建时间</th>
                                    <th>进度</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
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

<#-- 统计创建窗体 -->
<div class="modal fade" id="create-statistics-dlg">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title center-block">上号统计</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <form id="statistics-task-form" class="form-horizontal">
                            <div class="form-group">
                                <label for="statistics-name" class="col-sm-2 control-label">统计名称</label>
                                 <div class="col-sm-10">
                                     <input type="text" name="taskName" class="form-control" id="statistics-name" placeholder="名称" maxlength="40">
                                 </div>
                            </div>
                            <div class="form-group">
                                <label for="statistics-type" class="col-sm-2 control-label">统计类型</label>
                                <div class="col-sm-10">
                                    <select name="type"  id="statistics-type" class="form-control select2" style="width:100%" >
                                        <option value="1" selected="selected">站点</option>
                                        <option value="2">设备</option>
                                        <option value="3">运营商</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="statistics-items" class="col-sm-2 control-label">统计项目</label>
                                <div class="col-sm-10">
                                    <select name="items" class="form-control select2" multiple="multiple" data-placeholder="统计项" id="statistics-items" style="width: 100%;">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="statistics-unit" class="col-sm-2 control-label">统计单位</label>
                                <div class="col-sm-10">
                                    <select name="unit"  id="statistics-unit" class="form-control select2" style="width:100%" >
                                        <option value="1" selected="selected">天</option>
                                        <option value="2">小时</option>
                                        <option value="3">分钟</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="statistics-range-time" class="col-sm-2 control-label">时间范围</label>
                                <div class="col-sm-10">
                                    <input type="text" name="rangeTime" class="form-control" id="statistics-range-time" placeholder="时间范围" >
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left btn-flat" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-flat" id="create-task-btn">创建</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<#-- 统计创建窗体 -->

<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/plugins/jquery-idleTimeout/store.min.js"></script>
<script src="/plugins/jquery-idleTimeout/jquery-idleTimeout.min.js"></script>
<script src="/plugins/sockjs/sockjs.min.js"></script>
<script src="/js/notifyHandle.js"></script>
<script src="/plugins/fastclick/fastclick.js"></script>
<script src="/plugins/select2/select2.full.min.js"></script>
<script src="/plugins/select2/i18n/zh-CN.js"></script>
<script src="/plugins/daterangepicker/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/plugins/datatables/dataTables.buttons.min.js"></script>
<script src="/plugins/datatables/buttons.bootstrap.min.js"></script>
<script src="/plugins/messenger/messenger.js"></script>
<script src="/plugins/bootbox/bootbox.min.js"></script>
<script src="/plugins/jqueryValidation/jquery.validate.min.js"></script>
<script src="/plugins/jqueryValidation/localization/messages_zh.min.js"></script>
<script src="/plugins/jqueryValidation/additional-methods.min.js"></script>
<script src="/js/validatorMethod.js"></script>
<script src="/js/efence.js"></script>
<script src="/js/page/imsiStatistics.js"></script>
</body>
</html>
