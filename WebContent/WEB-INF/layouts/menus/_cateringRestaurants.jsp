<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>${sessionScope.eventName}/${cuisineType} menu</h1>
</div>

<div class="col-sm-12">
	<h2>Select restaurants you are interested in</h2>
	<div class="col-sm-6 col-sm-offset-3">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title">Restaurants</h3>
			</div>
			<div class="panel-body" align="left">

				<c:choose>
					<c:when test="${empty restaurants}">Sorry! No <c:out
							value="${cuisine}"></c:out> restaurants registered with us.
				</c:when>

					<c:otherwise>

						<form class="form-horizontal" method="POST"
							id="select-restaurant-form"
							action="${pageContext.request.contextPath}/customer/event/requestQuote"
							onsubmit="return validateSelectRestaurantForm()"
							ectype="application/x-www-form-urlencoded" autocomplete="off">

							<c:forEach items="${restaurants}" var="r">
								<input type="checkbox" value="${r.id}" name="restaurantId"
									${prevR.contains(r.id)?"checked":""}>&nbsp;${r.name}
							</br>
							</c:forEach>
							<br>
							<div class="col-sm-2">
								<button type="submit" width="50px"
									class="btn btn-lg btn-primary">Next</button>
							</div>

							<input type="hidden" name="cuisineType" value="${menu.cuisine}">
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>