/**
 * Created by liuyuzhe on 2017/3/4.
 */

var User = {

    init : function() {
        var user = Base.init();

        user.checkUsername = function (username) {
            if (!user.isUsername(username)) {
                $("#alertUsername").show();
                return false;
            } else {
                $("#alertUsername").hide();
                return true;
            }
        };

        user.checkEmail = function (email) {
            if (!user.isEmail(email)) {
                $("#alertEmail").show();
                return false;
            } else {
                $("#alertEmail").hide();
                return true;
            }
        };

        user.checkPassword = function (password) {
            if (!user.isPassword(password)) {
                $("#alertPassword").show();
                return false;
            } else {
                $("#alertPassword").hide();
                return true;
            }
        };

        return user;
    }
};

(function () {
    var user = User.init();

    $("#registerForm").find('[type=text], [type=password]').blur(function() {
        switch ($(this).attr('name')) {
            case "username" :
                user.checkUsername($(this).val());
                break;
            case "email" :
                user.checkEmail($(this).val());
                break;
            case "password" :
                user.checkPassword($(this).val());
                break;
        }
    });

    $("#register").click(function() {
        var username = $("#registerForm input[name='username']").val();
        var email = $("#registerForm input[name='email']").val();
        var password = $("#registerForm input[name='password']").val();
        var repeatPassword = $("#repeatPassword").val();
        if (!user.checkUsername(username) || !user.checkEmail(email) || !user.checkPassword(password)) {
            return;
        }

        var agreeElem = $("#registerForm input[name='agree']");
        if (agreeElem.prop("checked")) {
            agreeElem.val(1);
        }

        var registerFormData = $("#registerForm :input")
            .filter(function() {
                return !user.isEmpty($(this).val);
            })
            .serialize();

        $.post({
            url : "/admin/user/register",
            dataType : "json",
            data : registerFormData,
            success : function(response) {
                if (response.code === 0) {
                    // 成功并弹窗
                    window.location.href = '/user/login';
                } else {
                    console.log(response.message);
                }
            },
            error : function(response) {
                console.log(response);
            }
        });
    });

    // TODO: 按需加载JS
    $("#loginForm").find('[type=text], [type=password]').blur(function() {
        switch ($(this).attr('name')) {
            case "username" :
                user.checkUsername($(this).val());
                break;
            case "password" :
                user.checkPassword($(this).val());
                break;
        }
    });

    $("#login").click(function() {
        var username = $("#loginForm input[name='username']").val();
        var password = $("#loginForm input[name='password']").val();
        if (!user.checkUsername(username) || !user.checkPassword(password)) {
            return;
        }

        var rememberElem = $("#loginForm input[name='remember']");
        if (rememberElem.prop("checked")) {
            rememberElem.val(1);
        }

        var loginFormData = $("#loginForm :input")
            .filter(function() {
                return !user.isEmpty($(this).val);
            })
            .serialize();

        $.post({
            url : "/admin/user/login",
            dataType : "json",
            data : loginFormData,
            success : function(response) {
                if (response.code === 0) {
                    if (!user.isEmpty(response.data)) {
                        var responseData = JSON.parse(response.data);
                        window.location.href = responseData.next;
                    } else {
                        window.location.href = "/";
                    }
                } else {
                    console.log(response.message);
                }
            },
            error : function(response) {
                console.log(response.message);
            }
        });
    });

})();





