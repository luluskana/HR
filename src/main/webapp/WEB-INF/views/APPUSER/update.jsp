<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <div class="row">
        <div class="col-sm-7">
            <form class="form-horizontal well" id="formUpdateUser">
                <fieldset>
                    <legend>Update User</legend>
                    <div class="form-group">
                        <label for="inputEmpId" class="col-sm-3 control-label">Employee ID</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="inputEmpId" placeholder="ID" type="text" value="${appUser.employeeID}" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputUsername" class="col-sm-3 control-label">Username</label>
                        <div class="col-sm-9">
                            <c:choose>
                                <c:when test="${appUser.username eq userLogin.username}">
                                    <input class="form-control" id="inputUsername" placeholder="Username" type="text" value="${appUser.username}" autocomplete="off" required disabled>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" id="inputUsername" placeholder="Username" type="text" value="${appUser.username}" autocomplete="off" required>
                                </c:otherwise>
                            </c:choose>
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
                        <label for="selectDepartment" class="col-sm-3 control-label">Department</label>
                        <div class="col-sm-9">
                            <select id="selectDepartment" class="form-control">
                                <option value="Production">Production</option>
                                <option value="Engineer">Engineer</option>
                                <option value="Sale">Sale</option>
                                <option value="HR">HR</option>
                                <option value="QA">QA</option>
                                <option value="MC">MC</option>
                                <option value="MIS">MIS</option>
                                <option value="Store">Store</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selectShift" class="col-sm-3 control-label">Shift</label>
                        <div class="col-sm-9">
                            <select id="selectShift" class="form-control">
                                <option value="Office">Office</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selectRole" class="col-sm-3 control-label">Role</label>
                        <div class="col-sm-9">
                            <select id="selectRole" class="form-control">
                                <option value="user">user</option>
                                <option value="admin">admin</option>
                                <option value="supervisor">supervisor</option>
                                <option value="om">om</option>
                                <option value="gm">gm</option>
                            </select>
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
        $('#selectDepartment option[value=${appUser.department}]').attr('selected','selected');
        $('#selectShift option[value=${appUser.shift}]').attr('selected','selected');
        $('#selectRole option[value=${appUser.roleName}]').attr('selected','selected');

        $("#formUpdateUser").submit(function() {
            var formData = new FormData();
            formData.append("id", "${appUser.id}");
            formData.append("employeeID", $("#inputEmpId").val());
            formData.append("username", $("#inputUsername").val());
            formData.append("password", $("#inputPassword").val());
            formData.append("name", $("#inputName").val());
            formData.append("sex", $('input[name=sex]:checked').val());
            formData.append("department", $("#selectDepartment").val());
            formData.append("shift", $("#selectShift").val());
            formData.append("phoneNumber", $("#inputTelephone").val());
            formData.append("roleName", $("#selectRole").val());
            $.ajax({
                type: "POST",
                headers: {
                    Accept: "application/json",
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "${home}appuser/update",
                processData: false,
                contentType: false,
                data: formData,
                async: false,
                success: function(data){
                    window.location.href = "${home}appuser?list";
                },
                error: function(data){
                    alert("Cannot update user.");
                    return false;
                }
            });
            return false;
        });

        $("#btnCancel").click(function() {
            window.location.href = "${home}appuser?list";
        });
    });
</script>