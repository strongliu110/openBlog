<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>StrongLiu's blog - 注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="../../../static/plugin/bootstrap-3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/common/css/common.css">
    <link rel="stylesheet" href="../../../static/admin/css/user.css">
</head>
<body>

<#include "auth_header.html"/>

<div class="container">
    <main class="main-content">
        <div class="register-box">
            <h1 class="text-center">欢迎加入</h1>
            <hr>
            <form id="registerForm">
                <fieldset class="register-form">
                    <div class="form-group">
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input type="text" name="username" class="form-control" placeholder="用户名">
                        </div>
                        <div id="alertUsername" class="form-alert" style="display: none">
                            <span>用户名应为6-18个字母、数字或下划线</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-envelope"></span>
                            </span>
                            <input type="text" name="email" class="form-control" placeholder="邮箱">
                        </div>
                        <div id="alertEmail" class="form-alert" style="display: none">
                            <span>请输入正确的邮箱地址</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password" name="password" class="form-control" placeholder="密码">
                        </div>
                        <div id="alertPassword" class="form-alert" style="display: none">
                            <span>密码应为6-18个字母、数字或下划线</span>
                        </div>
                    </div>
                    <div class="form-group form-inline">
                        <div class="checkbox">
                            <label>
                                <input name="agree" type="checkbox" checked="checked"> 我同意
                            </label>
                            <a href="javascript:"> 用户协议 </a>
                        </div>
                        <div class="pull-right">
                            <a href="javascript:"> 已有账号？</a>
                        </div>
                    </div>
                </fieldset>
                <button class="btn-block register-btn" id="register" type="button">注册</button>
            </form>
        </div>
    </main>
</div>

<script src="../../../static/plugin/jquery/jquery-3.1.1.min.js"></script>
<script src="../../../static/plugin/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="../../../static/common/js/base.js"></script>
<script src="../../../static/admin/js/menu.js"></script>
<script src="../../../static/admin/js/user.js"></script>

</body>
</html>