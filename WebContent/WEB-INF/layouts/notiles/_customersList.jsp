<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="customersList" class="sideMenuItemsDetail">
	<h2>Customers</h2>
	<c:choose>
		<c:when test="${empty customers}">
		There are 0 customers in the database.
	</c:when>

		<c:otherwise>
			<table class="list">
				<tr class="list">
					<th width="200px;" class="list">Name</th>
					<th width="200px;" class="list">Contact Number</th>
					<th width="400px;" class="list">Contact Email</th>
				</tr>
				<c:forEach items="${customers}" var="cust" varStatus="loopStatus">
					<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'} list">
						<td class="list">${cust.name}</td>
						<td class="list">${cust.contactNumber}</td>
						<td class="list">${cust.contactEmail}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</div>
