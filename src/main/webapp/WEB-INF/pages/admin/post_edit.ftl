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
                <h4 class="page-title">
                    <#if (postVo.post)?? >
                        编辑文章
                    <#else>
                        发布文章
                    </#if>
                </h4>
            </div>
            <div class="col-sm-12">
                <form id="articleForm" role="form">
                    <fieldset class="article-form">
                        <input type="hidden" name="id" value="${(postVo.post.id)!""}" />
                        <input type="hidden" name="content" value="${(postVo.post.content)!""}" />
                        <input type="hidden" name="categories" />
                        <input type="hidden" name="tags" >
                        <input type="hidden" name="fmt_type" value="${(postVo.post.fmt_type)!"markdown"}"/>

                        <div class="form-group col-md-6">
                            <input type="text" name="title" class="form-control" placeholder="文章标题" value="${(postVo.post.title)!""}">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" name="slug" class="form-control" placeholder="文章访问路径" value="${(postVo.post.slug)!""}"/>
                        </div>
                        <div class="form-group col-md-6">
                            <select id="select-categories" class="form-control" name="categories" multiple="multiple">
                                <#if categoryList?? >
                                    <#list categoryList as category >
                                        <option value="${category.id}"
                                            <#if (postVo.categoryList)?? && (postVo.categoryList)?seq_contains(category.name) >
                                                selected
                                            </#if> >
                                        ${category.name}
                                        </option>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <select id="select-tags" class="form-control" name="tags" multiple="multiple">
                            <#if tagList?? >
                                <#list tagList as tag >
                                    <option value="${tag.id}"
                                        <#if (postVo.tagList)?? && (postVo.tagList)?seq_contains(tag.name) >
                                            selected
                                        </#if> >
                                    ${tag.name}
                                    </option>
                                </#list>
                            </#if>
                            </select>
                        </div>
                        <div class="form-group col-xs-12">
                            <div class="pull-right">
                                <a type="button" class="btn btn-info btn-sm" id="switch-editor">切换为富文本编辑器</a>
                            </div>
                        </div>
                        <#if (postVo.post.fmt_type)!"" != "html" >
                            <div class="form-group col-md-12 md-container">
                                <textarea id="md-editor">${(postVo.post.content)!""}</textarea>
                            </div>
                        <#else>
                            <div class="form-group col-md-12 html-container">
                                <textarea id="summer-note">${(postVo.post.content)!""}</textarea>
                            </div>
                        </#if>
                        <div class="form-group col-md-3">
                            <label class="">文章状态</label>
                            <input type="checkbox" name="status" class="form-control"
                            <#if ((postVo.post.status)!"publish" == "publish") >
                                   checked
                            </#if> >
                        </div>
                        <div class="form-group col-md-3">
                            <label class="">评论状态</label>
                            <input type="checkbox" name="comment_status" class="form-control"
                            <#if ((postVo.post.comment_status)!"open" == "open") >
                                   checked
                            </#if> >
                        </div>
                        <div class="form-group col-md-3">
                            <label class="">添加缩略图</label>
                            <input id="add_thumb_url" type="checkbox" class="form-control"
                            <#if (postVo.post.thumb_url)?? >
                                   checked
                            </#if> >
                        </div>
                        <div id="thumb-url" class="form-group col-md-12">
                            <input type="text" name="thumb_url" class="form-control" placeholder="输入缩略图URL" value="${(postVo.post.thumb_url)!""}">
                        </div>
                    </fieldset>
                    <div class="text-right">
                        <div class="col-xs-12">
                            <button id="save_draft" type="button" class="btn btn-sm btn-info">存为草稿</button>
                            <button id="save_post" type="button" class="btn btn-sm btn-success">保存文章</button>
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
<script src="../../../static/common/js/base.js"></script>
<script src="../../../static/admin/js/post.js"></script>

</body>
</html>