<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> ${systemInfo.projectName } | 设备管理 </title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/jQueryUI/jquery-ui.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/select2/select2.min.css">
    <link rel="stylesheet" href="/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/plugins/datatables/buttons.bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/datatables/select.dataTables.min.css">
    <link rel="stylesheet" href="/plugins/datatables/select.bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger.css">
    <link rel="stylesheet" href="/plugins/messenger/messenger-theme-air.css">
    <link rel="stylesheet" href="/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/css/efence.css">
    <link rel="stylesheet" href="/bdmapApi2/bmap.css"/>
    <script type="text/javascript" src="/bdmapApi2/baidumap_offline_v2_load.js"></script>
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
                设备管理
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active"><a href="###"> 设备管理</a></li>
                <li class="active">设备管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="nav-tabs-custom" >
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"><a href="#sites-list" data-toggle="tab">站点</a></li>
                            <li><a href="#device-list" data-toggle="tab">设备</a></li>
                            <li class="pull-left header"><i class="fa fa-cubes"></i> 站点设备列表</li>
                        </ul>
                        <div class="tab-content">
                            <div class="chart tab-pane active" id="sites-list" >
                                <table id="sites-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <th></th>
                                        <th>站点编号</th>
                                        <th>站点名称</th>
                                        <th>地址</th>
                                        <th>经纬度</th>
                                        <th>创建日期</th>
                                        <th>备注</th>
                                        <th>操作</th>
                                    </thead>
                                </table>
                            </div>
                            <div class="chart tab-pane" id="device-list" >
                                <table id="devices-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <th>设备编号</th>
                                        <th>设备名称</th>
                                        <th>设备类型</th>
                                        <th>运营商</th>
                                        <th>工作频段</th>
                                        <th>创建日期</th>
                                        <th>备注</th>
                                        <th>所属站点</th>
                                        <th>操作</th>
                                    </thead>
                                </table>
                            </div>
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

<#--弹出窗体-->
<#---site 窗体-->
<div class="modal fade" id="site-dlg">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title center-block">站点信息</h4>
            </div>
            <div class="modal-body" style="height: 500px;overflow-y: scroll;">
                <form id="site-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="site-sn" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-sn" name="siteSn" placeholder="站点编号" maxlength="16">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-name" name="siteName" placeholder="站点名称" maxlength="40">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="province" class="col-sm-2 control-label">省</label>
                        <div class="col-sm-10">
                            <select name="province" id="province" style="width: 100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city" class="col-sm-2 control-label">市</label>
                        <div class="col-sm-10">
                            <select name="city" id="city" style="width: 100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="town" class="col-sm-2 control-label">区</label>
                        <div class="col-sm-10">
                            <select name="town" id="town" style="width: 100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-address" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-address" name="siteAddress" placeholder="详细地址" maxlength="40">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-ok" class="col-sm-2 control-label">经纬度</label>
                        <div class="col-sm-10" >
                            <button  type="button" class="btn btn-flat btn-sm btn-primary" id="PLL" >请选择经纬度</button>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="site-longitude" class="col-sm-2 control-label">经度</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-longitude" name="siteLongitude" placeholder="经度" maxlength="40">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-latitude" class="col-sm-2 control-label">纬度</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-latitude" name="siteLatitude" placeholder="纬度" maxlength="40">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-remark" class="col-sm-2 control-label">LAC</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-LC" name="siteLC" placeholder="LAC" maxlength="200">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-remark" class="col-sm-2 control-label">CI</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-CI" name="siteCI" placeholder="CI" maxlength="200">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="site-remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="site-remark" name="siteRemark" placeholder="备注信息" maxlength="200">
                        </div>
                    </div>
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="action" value="create">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left btn-flat" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-flat" id="site-ok-btn" >确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<#--device 窗体 -->
<div class="modal fade" id="device-dlg">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title center-block">设备信息</h4>
            </div>
            <div class="modal-body">
                <form id="device-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="device-sn" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="device-sn" name="deviceSn" placeholder="设备编号" maxlength="16">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="device-name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="device-name" name="deviceName" placeholder="设备名称" maxlength="40">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="device-type" class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <select name="deviceType" id="device-type" style="width: 100%">
                                <option value="1">CDMA</option>
                                <option value="2">GSM</option>
                                <option value="3">WCDMA</option>
                                <option value="4">TD-SCDMA</option>
                                <option value="5">TDD LTE</option>
                                <option value="6">FDD LTE</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="device-band" class="col-sm-2 control-label">Band</label>
                        <div class="col-sm-10">
                            <select name="deviceBand" id="device-band" style="width: 100%">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="device-operator" class="col-sm-2 control-label">运营商</label>
                        <div class="col-sm-10">
                            <select name="deviceOperator" id="device-operator" style="width: 100%">
                                <option value="1">中国移动</option>
                                <option value="2">中国电信</option>
                                <option value="3">中国联通</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="device-manufacturer" class="col-sm-2 control-label">生产厂家</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="device-manufacturer" name="deviceManufacturer" placeholder="设备生产厂家" maxlength="40">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="device-remark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="device-remark" name="deviceRemark" placeholder="备注信息" maxlength="200">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="belongTo" class="col-sm-2 control-label">所属站点</label>
                        <div class="col-sm-10">
                            <select name="belongTo" id="belongTo" style="width: 100%">
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="action" value="create">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left btn-flat" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-flat" id="device-ok-btn" >确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<#--弹出窗体-->
<!-- 上号异常配置dlg -->
<div class="modal fade" id="device-upnumex-dlg">
    <div class="modal-dialog" style="width: 700px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title center-block">上号异常配置</h4>
            </div>
            <div class="modal-body">
                <table id="device-upnumex-table" class="table table-striped table-bordered table-hover">
                    <thead>
                        <th></th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>告警时间间隔</th>
                        <th>操作</th>
                    </thead>
                    <tbody>

                    </tbody>
                </table>

                <table id="edit-upnumex-table" class="table" border="0">
                    <tbody>
                    <tr class="hidden">
                        <td style="width: 55%">
                            <input type="text" id="upnumex-config-edit-range-time" class="form-control"  placeholder="时间范围" >
                        </td>
                        <td style="width: 25%">
                            <input type="text" id="upnumex-config-edit-interval" class="form-control" placeholder="告警时间间隔（分）"
                        </td>
                        <td style="width: 20%">
                            <button id="edit-upnum-save-btn" class="btn btn-flat btn-sm btn-primary" >保存</button>
                            <button id="edit-upnum-cancel-btn" class="btn btn-flat btn-sm" >取消</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table id="add-upnumex-config-table" class="table" border="0">
                    <tbody>
                    <tr>
                        <td>
                            <a href="###" id="add-upnumex-config-btn" ><b>+</b>新增</a>
                        </td>
                    </tr>
                    <tr class="hidden">
                        <td style="width: 55%">
                            <input type="text" id="upnumex-config-range-time" class="form-control"  placeholder="时间范围" >
                        </td>
                        <td style="width: 25%">
                            <input type="text" id="upnumex-interval" class="form-control" placeholder="告警时间间隔（分）" required/>
                        </td>
                        <td style="width: 20%">
                            <button id="upnum-config-add-btn" class="btn btn-flat btn-sm btn-primary" >确定</button>
                            <button id="upnum-config-cancel-btn" class="btn btn-flat btn-sm" >取消</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <input type="hidden" id="upnumex_devicesn" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left btn-flat" data-dismiss="modal">取消</button>
                <button type="button" id="upnum-config-confirm-btn" class="btn btn-primary btn-flat" >确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<#--<div class="modal fade" id="map-map">
    <div class="modal-dialog" >
       &lt;#&ndash; <div class="modal-content">
            <div style="min-height: 800px; width:100%" id="device-map"></div>

        </div>&ndash;&gt;
           <div class="content-wrapper">
               <section class="content" style="position:relative">
                   <div style="min-height: 800px; width:100%" id="device-map"></div>
               </section>
            </div>
    </div>
</div>-->


<div  class="modal fade" id="map-map">
    <div class="modal-dialog" style="width: 700px">
        <div class="modal-content">

         <div class="modal-body">
                <div style="min-height: 800px; width:100%" id="device-map"></div>



             <div class="map-total-info" id="search_input">
               <#-- <span class="info-item">-->
                    <table>
                     <tr>
                         <td>
                             <label>经度：</label>
                             <input type="text" style="height: 32px;" readonly="true"  id="site-longitude2">
                         </td>
                         <td class="column2">
                             <label>纬度：</label>
                             <input type="text" style="height: 32px;" readonly="true" id="site-latitude2">
                         </td>
                     </tr>
                     <#--<tr>
                         <td>
                             <input type="text"  id="site-longitude2">
                         </td>
                         <td class="column2">
                             <input type="text" readonly="true" id="site-latitude2">
                         </td>
                     </tr>-->
                 </table>
                <#--</span>placeholder="请输入关键字进行搜索"-->
             </div>
                <input type="hidden" name="centerPointLng" id="center-point-lng" value="115.1828">
                <input type="hidden" name="centerPointLat" id="center-point-lat" value="38.94">
                <input type="hidden" name="zoomValue" id="zoom-value" value="8">
                <input type="hidden" name="mapOnline" id="map-online-sw" value="1">
            </div>
            <#--<div class="form-group">
                <label for="site-longitude" class="col-sm-2 control-label">经度</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="site-longitude1" name="siteLongitude" placeholder="经度" maxlength="40">
                </div>
            </div>
            <div class="form-group">
                <label for="site-latitude" class="col-sm-2 control-label">纬度</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="site-latitude1" name="siteLatitude" placeholder="纬度" maxlength="40">
                </div>
            </div>-->
            <div class="modal-footer">
                <button type="button" id="map-cancle" class="btn btn-default pull-left btn-flat" data-dismiss="modal">取消</button>
                <button type="button" id="map-ok" class="btn btn-primary btn-flat" >确定</button>
            </div>
        </div>
    </div>
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
<script src="/plugins/datatables/dataTables.buttons.min.js"></script>
<script src="/plugins/datatables/buttons.bootstrap.min.js"></script>
<script src="/plugins/datatables/dataTables.select.js"></script>
<script src="/plugins/messenger/messenger.js"></script>
<script src="/plugins/bootbox/bootbox.min.js"></script>
<script src="/plugins/jqueryValidation/jquery.validate.min.js"></script>
<script src="/plugins/jqueryValidation/localization/messages_zh.min.js"></script>
<script src="/plugins/jqueryValidation/additional-methods.min.js"></script>
<script src="/js/validatorMethod.js"></script>
<script src="/js/efence.js"></script>
<script src="/js/page/devices.js"></script>
<script src="/js/page/deviceAlarmConfig.js"></script>
<script src="/js/map/RichMarker.js"></script>
<script src="/js/map/InfoBox.js"></script>
<script src="/js/map/siteMarker.js"></script>
<#--<script src="/js/page/devicesmap.js"></script>-->
</body>
</html>
