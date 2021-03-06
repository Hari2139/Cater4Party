<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body onload="initialize()">
<div class="col-sm-offset-2 page-header">
	<h1>${sessionScope.eventName}/${menu.cuisine} menu</h1>
</div>

<div class="col-sm-12">
	<form class="form-horizontal" method="POST" id="menu-form"
		action="${pageContext.request.contextPath}/menu/saveMenu"
		onsubmit="return validateMenuFormOnSubmit();"
		enctype="application/x-www-form-urlencoded" autocomplete="off">
		<div class="row">
			<c:forEach items="${menu.categories}" var="category">
				<div class="col-sm-6">
					<c:choose>
						<c:when
							test="${category.name.contains('NON-') || category.name.contains('SEAFOOD')}">
							<div class="panel panel-danger">
						</c:when>
						<c:otherwise>

							<div class="panel panel-success">
						</c:otherwise>
					</c:choose>
					<div class="panel-heading">
						<h3 class="panel-title">${category.name}</h3>
					</div>
					<div class="panel-body" align="left">
						<c:forEach items="${category.items}" var="item">
							<input type="checkbox" value="${item.code}" name="itemCode"
								${item.isSelected()?"checked":""}>
						${item.name}<br>
						</c:forEach>
					</div>
				</div>
		</div>
		</c:forEach>
</div>

<div class="col-sm-2">
	<button type="button" class="btn btn-default"
		onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
		Cancel</button>
</div>

<div class="col-sm-2 col-sm-offset-8">
	<button type="submit" 
		class="btn btn-default">Next</button>
</div>


<input type="hidden" name="cuisineType" value="${menu.cuisine}">
</form>
</div>