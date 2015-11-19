<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>${event.name}</h1>
</div>

<div class="row">
	<div class="col-sm-4 col-sm-offset-1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Event details</h3>
			</div>
			<div class="panel-body" align="left">
				<b>Event name:</b> ${event.name}<br /> <b>Time:</b>
				<fmt:formatDate value="${event.date_time}"
					pattern="EEE, d MMM yyyy hh:mm aaa" />
				<br /> <b>Number of Adults:</b> <span style="color: red;">${event.personCount}</span><br />
				<b>Number of Kids:</b> <span style="color: red;">${event.kidsCount}</span><br />
				<b>Delivery Option:</b> <span style="color: red;">${event.isPickUp()?'Pick Up':'Delivered'}</span><br />
				<b>Customer name:</b> ${event.customer.name}<br />
				<c:if test="${q.status.toString() == 'CUSTOMER_ORDER_CONFIRMED'}">
					<b>Customer contact number:</b>
					<c:out
						value="(${fn:substring(event.customer.contactNumber, 0, 3)}) ${fn:substring(event.customer.contactNumber, 3, 6)}-${fn:substring(event.customer.contactNumber, 6, 10)}" />
				</c:if>
				<br />
			</div>
		</div>
	</div>
</div>

<c:forEach items="${menus}" var="menu">
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h3 class="panel-title">${menu.cuisine} Menu</h3>
				</div>
				<div class="panel-body" align="left">
					<div align="right">
						<c:if
							test="${event.status == 'ACTIVE' && user.role == 'CUSTOMER'}">
							<a
								href="${pageContext.request.contextPath}/menu/selectMenu?eventId=${event.id}&cuisineType=${menu.cuisine}"
								role="button" class="btn btn-default"><span
								class="glyphicon glyphicon-edit"></span> Edit Menu</a>
						</c:if>
					</div>
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
					<c:if test="${menu.cuisine == 'PIZZA'}">
						<c:forEach items="${pizza_items}" var="pi">
							<div class="col-sm-12">
								<c:choose>
									<c:when test="${pi.key.contains('#')}">
										<ul>
											<li><b>${fn:substringBefore(pi.key, ' #')}</b>
												&nbsp;&nbsp; ${pi.value}</li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul>
											<li><b>${pi.key}</b> &nbsp;&nbsp; ${pi.value}</li>
										</ul>
									</c:otherwise>
								</c:choose>


							</div>
						</c:forEach>
					</c:if>
					<c:if test="${menu.cuisine == 'MEXICAN'}">
						<c:forEach items="${mexican_items}" var="m">
							<div class="col-sm-12">
								<ul>
									<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
								</ul>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${menu.cuisine == 'THAI'}">
						<c:forEach items="${thai_items}" var="m">
							<div class="col-sm-12">
								<ul>
									<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
								</ul>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${menu.cuisine == 'SANDWICH'}">
						<c:forEach items="${sandwich_items}" var="m">
							<div class="col-sm-12">
								<ul>
									<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
								</ul>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${not empty menu.comments}">
						<c:choose>
							<c:when test="${user.role == 'RESTAURANT'}">
								<b>Comments from Customer:</b>
								<br />
							</c:when>
							<c:otherwise>
								<b>Your comments:</b>
								<br />
							</c:otherwise>
						</c:choose>
						<pre>${menu.comments}</pre>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<div class="col-sm-1 col-sm-offset-1">
	<button type="button" class="btn btn-default"
		onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">Back</button>
	<br /> <br /> <br /> <br />
</div>