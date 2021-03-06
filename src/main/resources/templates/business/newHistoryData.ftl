<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> ${systemInfo.projectName } | 历史数据 </title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/jQueryUI/jquery-ui.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/select2/select2.min.css">
    <link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger-theme-air.css">
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/plugins/zTree-v3/css/metroStyle/metroStyle.css">

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
                历史数据
                <small>上报数据</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><span> 数据采集</span></li>
                <li class="active">历史数据</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">查询参数</h3>
                        </div>
                    <#-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <form>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group" >
                                                    <label>时间范围:</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-clock-o"></i>
                                                        </div>
                                                        <input name="captureRangeTime" type="text" class="form-control pull-right" id="capture-range-time">
                                                    </div>
                                                <#-- /.input group -->
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" >
                                                    <label>运营商:</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-university"></i>
                                                        </div>
                                                        <select id="capture-operator" name="captureOperator" class="form-control select2" style="width: 100%;">
                                                            <option value="" selected="selected">不限</option>
                                                            <option value="中国移动">中国移动</option>
                                                            <option value="中国电信">中国电信</option>
                                                            <option value="中国联通">中国联通</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" >
                                                    <label>归属地:</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa  fa-street-view"></i>
                                                        </div>
                                                        <select id="capture-homeOwnership" name="captureHomeOwnership" class="form-control select2" style="width: 100%;">
                                                        </select>
                                                    </div>
                                                <#-- /.input group -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group" >
                                                    <label>站点:</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa  fa-cubes"></i>
                                                        </div>
                                                        <!--<button  type="button" id="site-ok" style="border-width: 1px;width:20%;height: 34px;background-color:  white;">选择站点</button>-->
                                                        <input type="text" id="site-text" class="form-control pull-right" style="background-color: #ffff;" readonly="readonly"></input>
                                                        <!--<select id="capture-site-sn" name="captureSiteSN" class="form-control select2" style="width: 100%;">
                                                        </select>-->
                                                    </div>
                                                <#-- /.input group -->
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group" >
                                                    <label>设备:</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa  fa-cube"></i>
                                                        </div>
                                                        <select id="capture-device-sn" name="captureDeviceSN" class="form-control select2" style="width: 100%;">
                                                        </select>
                                                    </div>
                                                <#-- /.input group -->
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="width:222px;">
                                                <div class="form-group" >
                                                    <label>IMSI</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-mobile-phone"></i>
                                                        </div>
                                                        <input name="captureIMSI" type="text" maxlength="16" class="form-control pull-right" id="capture-imsi">
                                                    </div>
                                                <#-- /.input group -->
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="width:222px;">
                                                <div class="form-group" >
                                                    <label>IMEI</label>
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-mobile-phone"></i>
                                                        </div>
                                                        <input name="captureIMEI" type="text" maxlength="16" class="form-control pull-right" id="capture-imei">
                                                    </div>
                                                <#-- /.input group -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="pull-right">
                                                    <button type="button" class="btn btn-primary" id="query-condition-OK" >查询</button>
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-primary btn-flat" id="export-data-btn" >导出</button>
                                                        <button type="button" class="btn btn-primary btn-flat dropdown-toggle" data-toggle="dropdown" id="export-data-dropdown-btn">
                                                            <span class="caret"></span>
                                                            <span class="sr-only">Toggle Dropdown</span>
                                                        </button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li><a href="javascript:void(0);" id="export-data-txt-btn" >导出TXT</a></li>
                                                            <li><a href="javascript:void(0);" id="export-data-csv-btn">导出CSV</a></li>
                                                            <li><a href="javascript:void(0);" id="export-data-xls-btn">导出XLS</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-success">
                        <div class="box-header">
                            <h3 class="box-title">数据列表</h3>
                        </div>
                        <#-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <table id="history-data-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                         <#-- <th style="width: 80px">序号</th>-->
                                            <th>IMSI</th>
                                            <th>IMEI</th>
                                            <th>运营商</th>
                                            <th>归属地</th>
                                            <th>站点编号</th>
                                            <th>站点名称</th>
                                            <th>设备编号</th>
                                          <#--  <th>设备名称</th>-->
                                            <th>捕获时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
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

<#-- 选择站点窗体 -->
<div class="modal fade" id="site-dlg">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="width: 300px;margin-left: 280px;height: 532px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title center-block">请选择查询站点</h4>
            </div>
            <div class="modal-body" style="width: 300px;height: 417px;overflow-y: scroll;">
                <div id="treeDemo" class="ztree"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left btn-flat" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary btn-flat"  id="site_submit" >确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<#-- 选择站点窗体 -->

<div class="modal fade" id="export-progress-dlg">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title center-block">数据导出</h4>
            </div>
            <div class="modal-body">
                <div class="progress" id="export-progress-bar">
                    <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                        <span class="sr-only">0% Complete (success)</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div class="modal fade" id="showWait" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 150px;">
            <div class="modal-header" style="height:40px">
                <div id="divId" style="font-size: large;font-weight: inherit;">提示:正在为您导出Excel文件，我们最多为您导出300000条数据 </div>
            </div>
            <div class="modal-body" >
                <div style="font-size: large;font-weight: inherit;text-align: center;">正在为您下载，请稍后...</div>
                <div class="progress">
                    <div id="bar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                        <span id="percent" class="sr-only">100% Complete</span>
                    </div>
                </div>
            </div>
           <div class="modal-footer">
               <!-- <button type="button" class="btn btn-primary" data-dismiss="modal">后台下载</button>-->
            </div>
        </div>
        &lt;!&ndash; /.modal-content &ndash;&gt;
    </div>
    &lt;!&ndash; /.modal-dialog &ndash;&gt;
</div>


<div class="modal fade" id="waining">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 150px;">
            <div class="modal-header" style="height:60px">
                <div style="font-size: x-large;font-weight: inherit;">警告:
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
            <div class="modal-body" >
                <div style="font-size: large;font-weight: inherit;text-align: center;">您的查询条件已变更，请先进行查询。</div>
            </div>
            <div class="modal-footer">
                 <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
        &lt;!&ndash; /.modal-content &ndash;&gt;
    </div>
    &lt;!&ndash; /.modal-dialog &ndash;&gt;
</div>





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
<script src="/plugins/messenger/messenger.js"></script>
<script src="/js/efence.js"></script>
<script src="/m16/js/md5.js"></script>
<script src="/js/page/newHistoryData.js"></script>
<script src="/m16/js/dataTables.default.js"></script>
<script src="/plugins/zTree-v3/js/jquery.ztree.all.js"></script>
<!--<script src="/m16/js/jquery.base64.js"></script>-->

</body>
</html>
