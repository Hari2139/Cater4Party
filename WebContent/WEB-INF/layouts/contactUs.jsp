<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Contact Us</h1>
</div>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<ul>
			<c:forEach items="${errors}" var="e">
				<li>${e}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<ul>
			<c:forEach items="${successMessages}" var="sm">
				<li>${sm}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<ul>
			<c:forEach items="${warnings}" var="w">
				<li>${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>

<div class="col-sm-10">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Head Quarters</h3>
		</div>
		<div class="panel-body">
			Rancho Cordova, Sacramento, CA 95670
		</div>
	</div>
</div>

<div class="col-sm-10">
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Customer Service</h3>
		</div>
		<div class="panel-body">
			Call Center: 1-800-xxx-xxxx<br> Hours: Monday to Sunday - 9am to
			9pm PST
		</div>
	</div>
</div>

<div class="col-sm-10">
	<div class="panel panel-warning">
		<div class="panel-heading">
			<h3 class="panel-title">Email</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="POST" id="contactUsForm"
				action="${pageContext.request.contextPath}/contactUs/email"
				novalidate ectype="application/x-www-form-urlencoded"
				autocomplete="off">
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Name: </label>
					<div class="col-sm-6">
						<input type="text" id="name" name="name" required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email: </label>
					<div class="col-sm-6">
						<input type="email" id="email" name="email" required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">To: </label>
					<span class="col-sm-4 text-muted" style="font-family:courier;">${adminEmail} (Admin)</span>
				</div>
				<div class="form-group">
					<label for="subject" class="col-sm-2 control-label">Subject: </label>
					<div class="col-sm-6">
						<input type="text" id="subject" name="subject" required="required"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="message" class="col-sm-2 control-label">Message: </label>
					<div class="col-sm-6">
						<textarea class="form-control" rows="6"  id="message" name="message" required="required"></textarea>
					</div>
				</div>
				<button type="submit" class="btn btn-lg btn-primary btn-block">Submit
				</button>

			</form>
		</div>
	</div>
</div>