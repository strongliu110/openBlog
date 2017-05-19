<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>StrongLiu's blog - </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="../../../static/plugin/bootstrap-3.3.7/css/bootstrap.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../static/plugin/select2-4.0.3/css/select2.css">
    <link rel="stylesheet" href="../../../static/plugin/mditor/css/mditor.css" />
    <link rel="stylesheet" href="../../../static/plugin/summernote-0.8.3/summernote.css">
    <link rel="stylesheet" href="../../../static/plugin/bootstrap-switch/css/bootstrap-switch.css">
    <link rel="stylesheet" href="../../../static/admin/css/style.css">
</head>
<body>

<#include "header.html">

<section class="content-page">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h4 class="page-title">发布文章</h4>
            </div>
            <div class="col-sm-12">
                <form id="articleForm" role="form">
                    <fieldset class="article-form">
                        <div class="form-group col-md-6">
                            <input type="text" name="title" class="form-control" placeholder="文章标题">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" name="slug" placeholder="文章访问路径"/>
                        </div>
                        <div class="form-group col-md-6">
                            <select id="select-categories" class="form-control" name="categories" multiple="multiple">
                                <option value="default">default</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <select id="select-tags" class="form-control" name="tags" multiple="multiple">
                                <option value="default">default</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-12">
                            <div class="pull-right">
                                <a type="button" class="btn btn-info btn-sm" id="switch-editor">切换为富文本编辑器</a>
                            </div>
                        </div>
                        <div class="form-group col-md-12 md-container">
                            <textarea id="md-editor"></textarea>
                        </div>
                        <div class="form-group col-md-12 html-container">
                            <textarea id="summer-note"></textarea>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="">文章状态</label>
                            <input type="checkbox" name="post-status" class="form-control" checked>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="">评论状态</label>
                            <input type="checkbox" name="post_comment_status" class="form-control" checked>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="">添加缩略图</label>
                            <input type="checkbox" name="add_thumb_url" class="form-control">
                        </div>
                        <div id="thumb-url" class="form-group col-md-12" hidden>
                            <input type="text" name="post_thumb_url" class="form-control" placeholder="输入缩略图URL">
                        </div>
                    </fieldset>
                    <div class="text-right">
                        <div class="col-xs-12">
                            <button type="button" class="btn btn-sm btn-info">存为草稿</button>
                            <button type="button" class="btn btn-sm btn-success">保存文章</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="../../../static/plugin/jquery/jquery-3.1.1.min.js"></script>
<script src="../../../static/plugin/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="../../../static/plugin/select2-4.0.3/js/select2.js"></script>
<script src="../../../static/plugin/mditor/js/mditor.js"></script>
<script src="../../../static/plugin/summernote-0.8.3/summernote.js"></script>
<script src="../../../static/plugin/bootstrap-switch/js/bootstrap-switch.js"></script>
<script src="../../../static/admin/js/post.js"></script>

</body>
</html>