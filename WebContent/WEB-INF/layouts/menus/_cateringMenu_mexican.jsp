<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_mexican_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		mexican_menu_items.splice($.inArray(data, mexican_menu_items), 1);
		divToRemove.remove();
	}

	function mexican_menu_submit() {
		if (mexican_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(mexican_menu_items);
		//console.log(JSON.stringify(mexican_menu_items));
		$("#mexican-menu-items").val(JSON.stringify(mexican_menu_items));
		$("#mexicantarget").submit();
	}
</script>

<!-- Page Canvas-->
<div id="page-canvas">
	<input type="hidden" id="refreshed" value="no">
	<!--Off Canvas Navigation-->
	<nav class="off-canvas-navigation">
		<header>Navigation</header>
		<div class="main-navigation navigation-off-canvas"></div>
	</nav>
	<!--end Off Canvas Navigation-->

	<!--Page Content-->
	<div id="page-content">
		<!--/.container-->
		<section id="image">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<div class="text-banner">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/marker.png"
								alt="">
						</figure>
						<div class="description">
							<h2>Pick the desired Menu</h2>
							<p>Just click on each of the item to get them selected. Its
								as easy as that.</p>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
			<div class="background">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg.jpg"
					alt="">
			</div>
			<!--/.background-->
		</section>

		<section class="container" style="padding-top: 50px;">
			<div class="">
				<!--Content-->
				<div class="">
					<h3>Click on the image below to build your items.</h3>
					<!--Listing Grid-->
					<section class="block equal-height col-md-6 col-xs-12">
						<div class="row">
							<c:forEach items="${menu.categories}" var="category">
								<c:forEach items="${category.items}" var="item" varStatus="loop">

									<div class="col-md-4 col-sm-3 col-xs-6">
										<div class="item" id="C${loop.index}">
											<div class="image">
												<a class="popup-with-form" href="#popup_${loop.index}">
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div>
													<div>
														<span hidden="hidden">${item.code}</span>
													</div> <img
													src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/MEXICAN/${item.code}.jpg"
													alt="">
												</a>
											</div>
										</div>
										<!-- /.item-->
									</div>
								</c:forEach>
							</c:forEach>
						</div>
						<!--/.row-->
					</section>

					<section class="col-md-6 col-xs-12">
						<div class="col-md-12 col-sm-12">
							<section>
								<!-- /.block -->
								<article class="block">
									<header>
										<h2>Menu Summary</h2>
									</header>
									<div class="list-slider owl-carousel owl-theme owl-loaded">

										<!-- /.slide -->
										<div class="slide">
											<header>
												<h3>
													<i class="fa fa-calendar"></i>Selected Items
												</h3>
											</header>
											<c:forEach items="${mexican_items}" var="m" varStatus="loop">
												<div class="list-item" id="m_${loop.index}">
													<div class="left">
														<h4>${m.key}</h4>
														<figure>${m.value}</figure>
													</div>
													<span class="mexican-item-close remove-item"
														onclick="remove_mexican_item('m_${loop.index}');">X</span>
													<div class="right "></div>
												</div>
											</c:forEach>
										</div>
									</div>
									<!-- /.list-slider -->
								</article>
								<!-- /.block -->

							</section>
						</div>
						<div class="col-md-12 col-sm-12">
							<section>
								<div class="form-group clearfix" style="text-align: center;">
									<form action="${pageContext.request.contextPath}/menu/saveMenu"
										id="mexicantarget" method="post">
										<input type="hidden" name="mexican_menu_items"
											id="mexican-menu-items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<figure class="note butnote">ONCE THE DESIRED MENU IS
											SELECTED, CLICK ON THE BUTTON BELOW TO SELECT THE RESTAURANTS
											TO REQUEST QUOTE FROM
										</figure>
										<c:choose>
											<c:when test="${sessionScope.user.isGuest()}">
												<button type="button" onclick="mexican_menu_submit();"
													class="btn btn-default">Next</button>
											</c:when>
											<c:otherwise>
												<button type="button" onclick="mexican_menu_submit();"
													class="btn btn-default">Select Restaurants</button>
											</c:otherwise>
										</c:choose>
									</form>
								</div>

							</section>
						</div>
					</section>
					<!--end Listing Grid-->
				</div>
			</div>
		</section>
	</div>
	<!-- end Page Content-->
</div>
<!-- end Page Canvas-->

<div id="popup_0"
	class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0" class="form-horizontal"
		onsubmit="return populateMexicanTacoBarSelectedItems();">
		<span id="mexican-popup-title"><h2>Taco Bar</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Size:
			</label>
			<div class="col-sm-6">
				<input type="text" name="ttsize" class="form-control" value="5 inch" disabled>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortillas Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="tcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Type<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="ttype" required="required" value="Corn">
						Corn
					</div>
					<div class="input-group">
						<input type="radio" name="ttype" required="required" value="Flour">
						Flour
					</div>
					<div class="input-group">
						<input type="radio" name="ttype" required="required"
							value="Half Corn & Half Flour"> Half Corn & Half Flour
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Servings:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Steak"> Steak
					</div>
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Grilled Shrimp">
						Grilled Shrimp
					</div>
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Grilled Mahi Mahi">
						Grilled Mahi Mahi
					</div>
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Grilled Salmon">
						Grilled Salmon
					</div>
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Grilled Tilapia">
						Grilled Tilapia
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Beans: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="tbeans" value="Black Beans">
						Black Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="tbeans" value="Pinto Beans">
						Pinto Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="tbeans" value="Refried Beans">
						Refried Beans
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Rice: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="trice" value="Citrus rice">
						Citrus rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="trice" value="Mexican rice">
						Mexican rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="trice" value="Cilantro rice">
						Cilantro rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="trice" value="Lime rice">
						Lime rice
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Salsa: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="tsalsa" value="Hot Green">
						Hot (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsalsa" value="Hot Red">
						Hot (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsalsa" value="Medium Green">
						Medium (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsalsa" value="Medium Red">
						Medium (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsalsa" value="Mild Green">
						Mild (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsalsa" value="Mild Red">
						Mild (Red)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="tcheese" value="Jack and Cheddar"> Jack and Cheddar
					</div>
					<div class="input-group">
						<input type="checkbox" name="tcheese" value="Monterey Jack">
						Monterey Jack
					</div>
					<div class="input-group">
						<input type="checkbox" name="tcheese" value="Mexican Cheese/Queso Fresco">
						Mexican Cheese/Queso Fresco
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Toppings: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="ttop" value="Lettuce">
						Lettuce
					</div>
					<div class="input-group">
						<input type="checkbox" name="ttop" value="Sour Cream">
						Sour Cream
					</div>
					<div class="input-group">
						<input type="checkbox" name="ttop" value="Guacamole">
						Guacamole
					</div>
					<div class="input-group">
						<input type="checkbox" name="ttop" value="Cilantro">
						Cilantro
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="tspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_1"
	class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_1" class="form-horizontal"
		onsubmit="return populateMexicanBurritoBarSelectedItems();">
		<span id="mexican-popup-title"><h2>Burrito Bar</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Size:
			</label>
			<div class="col-sm-6">
				<input type="text" name="btsize" class="form-control" value="12 inch" disabled>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Burrito Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="bcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Type<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="btype" required="required" value="Corn">
						Corn
					</div>
					<div class="input-group">
						<input type="radio" name="btype" required="required" value="Flour">
						Flour
					</div>
					<div class="input-group">
						<input type="radio" name="btype" required="required"
							value="Half Corn & Half Flour"> Half Corn & Half Flour
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Servings:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="bmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="bmeat" value="Steak"> Steak
					</div>
					<div class="input-group">
						<input type="checkbox" name="bmeat" value="Grilled Shrimp">
						Grilled Shrimp
					</div>
					<div class="input-group">
						<input type="checkbox" name="bmeat" value="Grilled Mahi Mahi">
						Grilled Mahi Mahi
					</div>
					<div class="input-group">
						<input type="checkbox" name="bmeat" value="Grilled Salmon">
						Grilled Salmon
					</div>
					<div class="input-group">
						<input type="checkbox" name="bmeat" value="Grilled Tilapia">
						Grilled Tilapia
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Beans: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="bbeans" value="Black Beans">
						Black Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="bbeans" value="Pinto Beans">
						Pinto Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="bbeans" value="Refried Beans">
						Refried Beans
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Rice: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="brice" value="Citrus rice">
						Citrus rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="brice" value="Mexican rice">
						Mexican rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="brice" value="Cilantro rice">
						Cilantro rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="brice" value="Lime rice">
						Lime rice
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Salsa: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="bsalsa" value="Hot Green">
						Hot (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsalsa" value="Hot Red">
						Hot (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsalsa" value="Medium Green">
						Medium (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsalsa" value="Medium Red">
						Medium (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsalsa" value="Mild Green">
						Mild (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsalsa" value="Mild Red">
						Mild (Red)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="bcheese" value="Jack and Cheddar"> Jack and Cheddar
					</div>
					<div class="input-group">
						<input type="checkbox" name="bcheese" value="Monterey Jack">
						Monterey Jack
					</div>
					<div class="input-group">
						<input type="checkbox" name="bcheese" value="Mexican Cheese/Queso Fresco">
						Mexican Cheese/Queso Fresco
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Toppings: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="btop" value="Lettuce">
						Lettuce
					</div>
					<div class="input-group">
						<input type="checkbox" name="btop" value="Sour Cream">
						Sour Cream
					</div>
					<div class="input-group">
						<input type="checkbox" name="btop" value="Guacamole">
						Guacamole
					</div>
					<div class="input-group">
						<input type="checkbox" name="ttop" value="Cilantro">
						Cilantro
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="bspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_2"
	class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2" class="form-horizontal"
		onsubmit="return populateMexicanEnchiladaBarSelectedItems();">
		<span id="mexican-popup-title"><h2>Enchilada Bar</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Size:
			</label>
			<div class="col-sm-6">
				<input type="text" name="etsize" class="form-control" value="5 inch" disabled>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Enchilada Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="ecount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Type<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="etype" required="required" checked="checked" value="Corn">
						Corn
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Servings:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="emeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="emeat" value="Steak"> Steak
					</div>
					<div class="input-group">
						<input type="checkbox" name="emeat" value="Grilled Shrimp">
						Grilled Shrimp
					</div>
					<div class="input-group">
						<input type="checkbox" name="emeat" value="Grilled Mahi Mahi">
						Grilled Mahi Mahi
					</div>
					<div class="input-group">
						<input type="checkbox" name="emeat" value="Grilled Salmon">
						Grilled Salmon
					</div>
					<div class="input-group">
						<input type="checkbox" name="emeat" value="Grilled Tilapia">
						Grilled Tilapia
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Beans: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="ebeans" value="Black Beans">
						Black Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="ebeans" value="Pinto Beans">
						Pinto Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="ebeans" value="Refried Beans">
						Refried Beans
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Rice: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="erice" value="Citrus rice">
						Citrus rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="erice" value="Mexican rice">
						Mexican rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="erice" value="Cilantro rice">
						Cilantro rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="erice" value="Lime rice">
						Lime rice
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Salsa: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="esalsa" value="Hot Green">
						Hot (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="esalsa" value="Hot Red">
						Hot (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="esalsa" value="Medium Green">
						Medium (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="esalsa" value="Medium Red">
						Medium (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="esalsa" value="Mild Green">
						Mild (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="esalsa" value="Mild Red">
						Mild (Red)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="echeese" value="Jack and Cheddar"> Jack and Cheddar
					</div>
					<div class="input-group">
						<input type="checkbox" name="echeese" value="Monterey Jack">
						Monterey Jack
					</div>
					<div class="input-group">
						<input type="checkbox" name="echeese" value="Mexican Cheese/Queso Fresco">
						Mexican Cheese/Queso Fresco
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Toppings: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="etop" value="Lettuce">
						Lettuce
					</div>
					<div class="input-group">
						<input type="checkbox" name="etop" value="Sour Cream">
						Sour Cream
					</div>
					<div class="input-group">
						<input type="checkbox" name="etop" value="Guacamole">
						Guacamole
					</div>
					<div class="input-group">
						<input type="checkbox" name="etop" value="Cilantro">
						Cilantro
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Sauce Type: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="esausetype" value="Red Sauce"> Red Sauce
					</div>
					<div class="input-group">
						<input type="checkbox" name="esausetype" value="Green Sauce">
						Green Sauce
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="espl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_3"
	class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_3" class="form-horizontal"
		onsubmit="return populateMexicanFajithaBarSelectedItems();">
		<span id="mexican-popup-title"><h2>Fajitha Bar</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Size:
			</label>
			<div class="col-sm-6">
				<input type="text" name="ftsize" class="form-control" value="5 inch" disabled>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Tortilla Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="fcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Servings:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="fmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="fmeat" value="Steak"> Steak
					</div>
					<div class="input-group">
						<input type="checkbox" name="fmeat" value="Grilled Shrimp">
						Grilled Shrimp
					</div>
					<div class="input-group">
						<input type="checkbox" name="fmeat" value="Grilled Mahi Mahi">
						Grilled Mahi Mahi
					</div>
					<div class="input-group">
						<input type="checkbox" name="fmeat" value="Grilled Salmon">
						Grilled Salmon
					</div>
					<div class="input-group">
						<input type="checkbox" name="fmeat" value="Grilled Tilapia">
						Grilled Tilapia
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Beans: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="fbeans" value="Black Beans">
						Black Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="fbeans" value="Pinto Beans">
						Pinto Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="fbeans" value="Refried Beans">
						Refried Beans
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Rice: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="frice" value="Citrus rice">
						Citrus rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="frice" value="Mexican rice">
						Mexican rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="frice" value="Cilantro rice">
						Cilantro rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="frice" value="Lime rice">
						Lime rice
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Salsa: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="fsalsa" value="Hot Green">
						Hot (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="fsalsa" value="Hot Red">
						Hot (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="fsalsa" value="Medium Green">
						Medium (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="fsalsa" value="Medium Red">
						Medium (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="fsalsa" value="Mild Green">
						Mild (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="fsalsa" value="Mild Red">
						Mild (Red)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="fcheese" value="Jack and Cheddar"> Jack and Cheddar
					</div>
					<div class="input-group">
						<input type="checkbox" name="fcheese" value="Monterey Jack">
						Monterey Jack
					</div>
					<div class="input-group">
						<input type="checkbox" name="fcheese" value="Mexican Cheese/Queso Fresco">
						Mexican Cheese/Queso Fresco
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Toppings: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="ftop" value="Lettuce">
						Lettuce
					</div>
					<div class="input-group">
						<input type="checkbox" name="ftop" value="Sour Cream">
						Sour Cream
					</div>
					<div class="input-group">
						<input type="checkbox" name="ftop" value="Guacamole">
						Guacamole
					</div>
					<div class="input-group">
						<input type="checkbox" name="ttop" value="Cilantro">
						Cilantro
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="fspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_4"
	class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_4" class="form-horizontal"
		onsubmit="return populateMexicanSaladBarSelectedItems();">
		<span id="mexican-popup-title"><h2>Salad Bar</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="scount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Main Serving<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="smain" required="required"
							value="Romaine Lettuce"> Romaine Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="smain" required="required"
							value="Spring mix"> Spring mix
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Servings:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="smeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="smeat" value="Steak"> Steak
					</div>
					<div class="input-group">
						<input type="checkbox" name="smeat" value="Grilled Shrimp">
						Grilled Shrimp
					</div>
					<div class="input-group">
						<input type="checkbox" name="smeat" value="Grilled Mahi Mahi">
						Grilled Mahi Mahi
					</div>
					<div class="input-group">
						<input type="checkbox" name="smeat" value="Grilled Salmon">
						Grilled Salmon
					</div>
					<div class="input-group">
						<input type="checkbox" name="smeat" value="Grilled Tilapia">
						Grilled Tilapia
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Beans: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="sbeans" value="Black Beans">
						Black Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="sbeans" value="Pinto Beans">
						Pinto Beans
					</div>
					<div class="input-group">
						<input type="checkbox" name="sbeans" value="Refried Beans">
						Refried Beans
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Rice: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="srice" value="Citrus rice">
						Citrus rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="srice" value="Mexican rice">
						Mexican rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="srice" value="Cilantro rice">
						Cilantro rice
					</div>
					<div class="input-group">
						<input type="checkbox" name="srice" value="Lime rice">
						Lime rice
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Salsa: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="ssalsa" value="Hot Green">
						Hot (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssalsa" value="Hot Red">
						Hot (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssalsa" value="Medium Green">
						Medium (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssalsa" value="Medium Red">
						Medium (Red)
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssalsa" value="Mild Green">
						Mild (Green)
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssalsa" value="Mild Red">
						Mild (Red)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="scheese" value="Jack and Cheddar"> Jack and Cheddar
					</div>
					<div class="input-group">
						<input type="checkbox" name="scheese" value="Monterey Jack">
						Monterey Jack
					</div>
					<div class="input-group">
						<input type="checkbox" name="scheese" value="Mexican Cheese/Queso Fresco">
						Mexican Cheese/Queso Fresco
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Toppings: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="stop" value="Lettuce">
						Lettuce
					</div>
					<div class="input-group">
						<input type="checkbox" name="stop" value="Sour Cream">
						Sour Cream
					</div>
					<div class="input-group">
						<input type="checkbox" name="stop" value="Guacamole">
						Guacamole
					</div>
					<div class="input-group">
						<input type="checkbox" name="stop" value="Cilantro">
						Cilantro
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings: </label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="checkbox" name="sdress" value="Chipotle Ranch">
						Chipotle Ranch
					</div>
					<div class="input-group">
						<input type="checkbox" name="sdress" value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="checkbox" name="sdress" value="Mexican dressing">
						Mexican dressing
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="sspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_5"
	class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_5" class="form-horizontal"
		onsubmit="return populateMexicanChipsSelectedItems();">
		<span id="mexican-popup-title"><h2>Chips & Salsa</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="ccount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Salsa: </label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="csalsa" value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="checkbox" name="csalsa" value="Medium">
						Medium
					</div>
					<div class="input-group">
						<input type="checkbox" name="csalsa" value="Hot"> Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Guacamole: </label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<input type="checkbox" name="cguac" value="yes">
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="cspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>
<script>
	$(window).load(function() {
		var rtl = false; // Use RTL
		initializeOwl(rtl);
		//Show only the first category when the window loads.
		//$('#C0').click();
		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
		//When the user clicks back button, force reload page.
		/*var e = document.getElementById("refreshed");
		if (e.value == "no")
			e.value = "yes";
		else {
			e.value = "no";
			location.reload();
		}*/
	});

	$('document').ready(function() {
		$('.slide .list-item .left').each(function() {
			var mexicanName = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + mexicanName);
			console.log("Desc: " + desc);
			mexican_menu_items.push(mexicanName + "+" + desc); //mexican_menu_items is in cater-mexican.js
		});

		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
