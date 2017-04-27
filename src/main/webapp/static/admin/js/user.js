/**
 * Created by liuyuzhe on 2017/3/4.
 */

var checkUsername = function (username) {
    if (!isUsername(username)) {
        $("#alertUsername").show();
        return false;
    } else {
        $("#alertUsername").hide();
        return true;
    }
}

var checkEmail = function (email) {
    if (!isEmail(email)) {
        $("#alertEmail").show();
        return false;
    } else {
        $("#alertEmail").hide();
        return true;
    }
}

var checkPassword = function (password) {
    if (!isPassword(password)) {
        $("#alertPassword").show();
        return false;
    } else {
        $("#alertPassword").hide();
        return true;
    }
}

$("#registerForm").find('[type=text], [type=password]').blur(function() {
    switch ($(this).attr('name')) {
        case "username" :
            checkUsername($(this).val());
            break;
        case "email" :
            checkEmail($(this).val());
            break;
        case "password" :
            checkPassword($(this).val());
            break;
    }
})

$("#register").click(function() {
    var username = $("#registerForm input[name='username']").val();
    var email = $("#registerForm input[name='email']").val();
    var password = $("#registerForm input[name='password']").val();
    var repeatPassword = $("#repeatPassword").val();
    if (!checkUsername(username) || !checkEmail(email) || !checkPassword(password)) {
        return;
    }

    $.post({
        url: "/user/register",
        dataType: "json",
        data: $("#registerForm").serialize(),
        success: function(response) {
            if (response.code == 0) {
                // 成功并弹窗
                window.location.href = '/user/login';
            } else {
                console.log(response.message);
            }
        },
        error: function(response) {
            console.log(response);
        }
    });
});

$("#loginForm").find('[type=text], [type=password]').blur(function() {
    switch ($(this).attr('name')) {
        case "username" :
            checkUsername($(this).val());
            break;
        case "password" :
            checkPassword($(this).val());
            break;
    }
});

$("#login").click(function() {
    var username = $("#loginForm input[name='username']").val();
    var password = $("#loginForm input[name='pasword']").val();
    if (!checkUsername(username) || !checkPassword(password)) {
        return;
    }

    $.post({
        url: "/user/login",
        dataType: "json",
        data : $("#loginForm").serialize(),
        success: function(response) {
            if (response.code == 0) {
                window.location.href = "/";
            } else {
                console.log(response.message);
            }
        },
        error: function(response) {
            console.log(response.message);
        }
    });
});


