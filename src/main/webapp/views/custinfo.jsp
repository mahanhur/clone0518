<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let custinfo_form = {
        init: function () {
            $('#custinfo_btn').click(function () {
                custinfo_form.send();
            });

        },
        validateAge: function () {
            $('#age').keyup(function () {
                var age = $('#age').val();
                if (!/^\d+$/.test(age)) {
                    age = age.replace(/\D/g, ""); // 숫자 이외의 문자를 제거합니다.
                    $('#check_age').text("나이는 숫자만 입력가능합니다.");
                }
                $('#age').val(age);
            });
        },
        gender: function() {
            let gender = $('#gender').data('gender');
            if (gender === 'M') {
                $('#male').prop('checked', true);
            } else if (gender === 'F') {
                $('#female').prop('checked', true);
            }
        },
        send: function () {
            $('#custinfo_form').attr({
                'action': '/custinfoimpl',
                'method': 'post'
            });
            $('#custinfo_form').submit();
            alert("고객님의 정보수정이 완료되었습니다.")
        }
    };

    $(function () {
        custinfo_form.init();
        custinfo_form.validateAge();
        custinfo_form.gender();
    });
</script>
<div class="col-sm-8">
    <div class="container">
        <h1>마이페이지</h1><br/>

        <form id="custinfo_form" class="form-horizontal text-left well">
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">아이디:</label>
                <div class="col-sm-8">
                    <input type="text" name="id" class="form-control" id="id" value="${custinfo.id}" readonly >
                    <div class="col-sm-10">
                        <span id="check_id" class="bg-danger"></span>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">비밀번호:</label>
                <div class="col-sm-8">
                    <input type="password" name="pwd" class="form-control" id="pwd" value="${custinfo.pwd}">
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">이름:</label>
                <div class="col-sm-8">
                    <input type="text" name="name" class="form-control" id="name" value="${custinfo.name}" >
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="age">나이:</label>
                <div class="col-sm-8">
                    <input type="text" name="age" class="form-control" id="age" value="${custinfo.age}">
                    <div class="col-sm-10">
                        <span id="check_age"></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="gender">성별:</label>
                <div class="col-sm-8">
                    <div class="form-control" id="gender" data-gender="${custinfo.gender}">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="female" value="F">F(Female)
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="male" value="M">M(Male)
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button id="custinfo_btn" class="btn btn-default">정보수정 하기</button>
                </div>
            </div>

        </form>

    </div>
</div>

<style>
    .container {
        width: 100%
    }
    #custinfo_btn {
        float: right;
    }
    #custinfo_btn {
        width: 150px;
        height: 30px;
        border-radius: 0;
        font-size: 12px;
        background-color: white;
        vertical-align: middle;
        margin-right: 20px;
    }
    #custinfo_btn:hover {
        color: white;
        background-color: #222222;
    }

</style>