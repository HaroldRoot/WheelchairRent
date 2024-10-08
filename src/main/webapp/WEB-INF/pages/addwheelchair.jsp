<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加轮椅信息</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<div class="wrapper" style="width: 900px;margin-top: 40px">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">发布轮椅信息</legend>
    </fieldset>
    <form id="addWheelchairForm" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">轮椅详情</label>
            <div class="layui-input-block">
                <input type="hidden" name="publisher" value="${loginUser.uNickName }">
                <textarea name="wheelchairDesc" placeholder="请输入内容" class="layui-textarea" required lay-verify="required" ></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">特点</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairModel" required lay-verify="required" placeholder="尽量简短"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">续航</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairArea" required lay-verify="required" placeholder="单位km"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">型号</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairFloor" required lay-verify="required" placeholder=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总数量</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairType" required lay-verify="required" placeholder=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发货地址</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairAddress" required lay-verify="required" placeholder=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">品牌名称</label>
            <div class="layui-input-block">
                <input type="text" name="communityName" required lay-verify="required" placeholder=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">租赁价格</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairPrice" required lay-verify="required|number" placeholder="每日价格"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairLinkMan" required lay-verify="required|phone" placeholder=""
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重量</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairOriented" required lay-verify="required" placeholder="单位kg"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>上传简介图片</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">简介图片</label>
            <div class="layui-upload layui-input-block">
                <button type="button" class="layui-btn layui-btn-primary" id="SingleUpload">上传图片</button>
                <img id="simpleImg" width="60px" height="60px">
            </div>
        </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>上传多张详细图片</legend>
        </fieldset>
        <div class="layui-form-item">
            <label class="layui-form-label">详细图片</label>
            <div class="layui-upload layui-input-block">
                <button type="button" class="layui-btn layui-btn-primary" id="MultipleUpload">选择详细图片</button>
                <button type="button" class="layui-btn" id="testListAction">开始上传</button>
                <div class="layui-upload-list">
                    <table class="layui-table">
                        <thead>
                        <tr><th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr></thead>
                        <tbody id="detailsList"></tbody>
                    </table>
                </div>
            </div>
        </div>
        <hr>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="addWheelchairRecord" id="addWheelchairRecord-btn">现在发布</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','layer','upload'],function () {
        var element = layui.element,
            form = layui.form ,
            layer = layui.layer,
            upload = layui.upload,
            $ = layui.jquery;

        upload.render({
            elem:"#SingleUpload",
            url:"/singleUpload",
            done: function(res, index, upload){
                console.log(res)
                //假设code=0代表上传成功
                if(res.code == 0){
                  layer.msg("文件加载成功！",{icon:1});
                  $("#simpleImg").attr("src",res.image);
                  $("#SingleUpload").addClass("layui-btn-disabled");
                  $("#SingleUpload").off("click");
                }
            }
        });

        var demoListView = $('#detailsList')
            ,uploadListIns = upload.render({
            elem: '#MultipleUpload'
            ,url: '/MultipleUpload'
            ,accept: 'file'
            ,multiple: true
            ,auto: false
            ,bindAction: '#testListAction'
            ,choose: function(obj){
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function(index, file, result){
                    var tr = $(['<tr id="upload-'+ index +'">'
                        ,'<td>'+ file.name +'</td>'
                        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                        ,'<td>等待上传</td>'
                        ,'<td>'
                        ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        ,'</td>'
                        ,'</tr>'].join(''));

                    //单个重传
                    tr.find('.demo-reload').on('click', function(){
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.demo-delete').on('click', function(){
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });

                    demoListView.append(tr);
                });
            }
            ,done: function(res, index, upload){
                if(res.code == 0){ //上传成功
                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            ,error: function(index, upload){
                var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });

        form.on("submit(addWheelchairRecord)",function(data){
        	$.post("addWheelchairRecord",$("#addWheelchairForm").serialize(),function(res){
        		if(res=="OK"){
        			 layer.msg("添加轮椅信息成功！",{icon:1,end:function(){window.location.href="addWheelchair";}});
                     $("#addWheelchairForm")[0].reset();
        		}
        	})
        	return false;
        });
    });
</script>
</body>
</html>
