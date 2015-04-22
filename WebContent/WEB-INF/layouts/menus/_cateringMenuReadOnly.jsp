<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>${event.name}</h1>
</div>

<div class="panel panel-warning">
	<div class="panel-heading">
		<h3 class="panel-title">Menu</h3>
	</div>
	<div class="panel-body" align="left">
		<c:forEach items="${menu.categories}" var="category">
			<c:if test="${not empty category.items}">
				<div class="col-sm-12">
					<ul>
						<li><b>${category.name}</b></li>
						<ol>
							<c:forEach items="${category.items}" var="item">
								<li>${item.name}</li>
							</c:forEach>
						</ol>
					</ul>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>

<div class="row">
	<div class="col-sm-6">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Event details</h3>
			</div>
			<div class="panel-body" align="left">
				<b>Event name:</b> ${event.name}<br /> <b>Time:</b>
				${event.date_time}<br /> <b>Number of people:</b> <span
					style="color: red;">${event.personCount}</span><br /> <b>Customer
					name:</b> ${event.customer.name}<br /> <b>Customer contact number:</b>
				${event.customer.contactNumber}<br />
			</div>
		</div>
	</div>
	<c:if test="${user.role == 'RESTAURANT'}">
		<div class="col-sm-6">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Quote</h3>
				</div>
				<div class="panel-body" align="left">
					<c:choose>
						<c:when test="${quote.menu.event.status eq 'ACTIVE'}">
							<form class="form-horizontal" method="POST"
								id="submit-price-form"
								action="${pageContext.request.contextPath}/restaurant/submitprice"
								ectype="application/x-www-form-urlencoded" autocomplete="off">
								<input type="text" hidden="true" value="${quote.id}"
									name="quoteId">
								<c:choose>
									<c:when test="${quote.price != null}">
										<div class="form-group">
											<label for="quotedPrice" class="col-sm-4 control-label">Price
												Quoted:</label>
											<div class="col-sm-2" align="left">
												<fmt:setLocale value="en_US" />
												<span style="color: red;"><fmt:formatNumber
														value="${quote.price}" type="currency" /></span>
											</div>
										</div>
										<div class="form-group">
											<label for="quotedPrice" class="col-sm-4 control-label">New
												Price:</label>
											<div class="col-sm-3">
												<input type="text" size="30" maxlength="50" name="price"
													required="required" pattern="[0-9]+(\.[0-9]{2})?"
													title="Example: 250.60" placeholder="0.00"
													class="form-control inputs">
											</div>
											<div class="col-sm-2" align="left">
												<button type="submit" class="btn btn-primary">Udpate</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-group">
											<label for="quotedPrice" class="col-sm-2 control-label">Price:</label>
											<div class="col-sm-3">
												<input type="text" size="30" maxlength="50" name="price"
													required="required" pattern="[0-9]+(\.[0-9]{2})?"
													title="Example: 250.60" placeholder="0.00"
													class="form-control inputs">
											</div>
											<div class="col-sm-2" align="left">
												<button type="submit" class="btn btn-primary">Submit</button>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
						</c:when>
						<c:otherwise>
							<label for="quotedPrice" class="col-sm-4 control-label">Price
								Quoted:</label>
							<div class="col-sm-2" align="left">
								<fmt:setLocale value="en_US" />
								<span style="color: red;"><fmt:formatNumber
										value="${quote.price}" type="currency" /></span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</c:if>
</div>

<div class="col-sm-1">
	<button type="button" class="btn btn-primary btn-block"
		onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
		Back</button>
</div>