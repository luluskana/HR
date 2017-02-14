<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <form class="form-horizontal well" id="formCreateTemplate">
                <fieldset>
                    <legend>Create Template OT</legend>
                    <div class="form-group">
                        <label for="selectDepartment" class="col-sm-3 control-label">Department</label>
                        <div class="col-sm-9">
                            <select id="selectDepartment" class="form-control">
                                <option>Production</option>
                                <option>Engineer</option>
                                <option>Sale</option>
                                <option>HR</option>
                                <option>QA</option>
                                <option>MC</option>
                                <option>MIS</option>
                                <option>Store</option>
                                <option>Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-4">
                            <div class="input-group">
                                <input type="text" class="form-control" id="employeeId" placeholder="Employee ID">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-raised btn-warning">Add</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $.material.init();
    });
</script>