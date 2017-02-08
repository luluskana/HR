<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <div class="row">
        <div class="col-sm-7">
            <form class="form-horizontal well" id="formUpdateUser">
                <fieldset>
                    <legend>Update Profile</legend>
                    <div class="form-group">
                        <label for="inputEmpId" class="col-sm-3 control-label">Employee ID</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="inputEmpId" placeholder="ID" type="text" value="${appUser.employeeID}" autocomplete="off" required disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputUsername" class="col-sm-3 control-label">Username</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="inputUsername" placeholder="Username" type="text" value="${appUser.username}" autocomplete="off" required disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="inputPassword" placeholder="Password" type="text" value="${appUser.password}" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class="col-sm-3 control-label">Name</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="inputName" placeholder="Name" type="text" value="${appUser.name}" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Sex</label>
                        <div class="col-sm-9">
                            <div class="radio radio-primary">
                                <label>
                                    <input name="sex" id="optionsRadios1" value="Male" checked="" type="radio">
                                    Male
                                </label>
                            </div>
                            <div class="radio radio-primary">
                                <label>
                                    <input name="sex" id="optionsRadios2" value="Female" type="radio">
                                    Female
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTelephone" class="col-sm-3 control-label">Telephone</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="inputTelephone" placeholder="Telephone Number" type="text" value="${appUser.phoneNumber}" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" id="btnCancel" class="btn btn-default">Cancel</button>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
        <div class="col-sm-5">
            <h2>Emphasis classes</h2>

            <p class="text-muted">HR System</p>

            <p class="text-primary">Management overtime and detail</p>

            <p class="text-warning">New technology in material design</p>

            <p class="text-danger">Not support Internet Explorer</p>

            <p class="text-success">Open source technology</p>

            <p class="text-info">Support by Mr. Apichat Eakwongsa</p>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {

        $.material.init();

        $('input[name=sex][value=${appUser.sex}]').attr('checked', 'checked');

        $("#formUpdateUser").submit(function() {
            var formData = new FormData();
            formData.append("id", "${appUser.id}");
            formData.append("username", $("#inputUsername").val());
            formData.append("password", $("#inputPassword").val());
            formData.append("name", $("#inputName").val());
            formData.append("sex", $('input[name=sex]:checked').val());
            formData.append("phoneNumber", $("#inputTelephone").val());
            $.ajax({
                type: "POST",
                headers: {
                    Accept: "application/json",
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "${home}appuser/updateProfile",
                processData: false,
                contentType: false,
                data: formData,
                async: false,
                success: function(data){
                    alert("update success.");
                    window.location.href = "${home}appuser/${appUser.id}?profile";
                },
                error: function(data){
                    alert("Cannot update user.");
                    return false;
                }
            });
            return false;
        });

        $("#btnCancel").click(function() {
            window.location.href = "${home}";
        });
    });
</script>