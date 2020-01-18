<html>
	<%@include file="../partials/head.html" %>
 <body>
 	<%@include file="../partials/navigation.html" %>
	
	 <div class="container">
	 	<h2>Vehicles</h2>
	 	<div class="content">
			<div class="row">
				<a class="btn btn-primary" href="http://localhost:8080/carRental/vehicles/create.jsp" role="button">Add New Vehicle</a>			 
			</div>
	 
		 	<div class="row">
		 	 	<div class="col-md-12">
					<div class="profile">
				 	<table id="userdata" class="table">
				 		<thead>
					        <th>Licence No</th>
					        <th>Model</th>
					        <th>Fuel</th>
					        <th>Type</th>
					        <th>Model</th>
					        <th>Capacity</th>
					        <th>Cost per Day</th>
					        <th style="width: 20%">Actions</th>
				   	 	</thead>
				    	<tbody>
				    	</tbody>
				   	</table>		   	
				 	</div>
				 </div>
			</div>
		</div>
	 </div>
</body>

<script>
	 $(document).ready(function($){
		 $(function() { 
			 var people = [];
			  $.getJSON('http://localhost:8080/carRental/webapi/vehicles/', function(data) {
			    $.each(data, function(f) {
			    	console.log();
			     	var tblRow = "<tr>" 
			     	+ "<td>" + data[f].vehicleLicenceNo + "</td>" + "<td>" + data[f].vehicleModel + "</td>"
			     	+ "<td>" + data[f].vehicleFuel+ "</td>" + "<td>" + data[f].vehicleType + "</td>" 
			     	+ "<td>" + data[f].vehicleModel+ "</td>" + "<td>" + data[f].vehicleCapacity + "</td>" 
			     	+ "<td>" + data[f].vehicleRentalCost+ "</td>"
	      		    + "<td>"
			     	+ "<a type='button' href='http://localhost:8080/carRental/cities/update.jsp?id="  + data[f].id + "' class='btn btn-primary'>"
			     	+  	"Edit"
			     	+ "</a>"
	      		    + "<nbsp>" 
	                + "<button id='deleteButton"+ data[f].vehicleLicenceNo + "' class='btn btn-danger'> Delete </button></td></tr>";
			               
			      	$(tblRow).appendTo("#userdata tbody");
			      	
			      	 $("#deleteButton" + data[f].id).on("click", function(){
			      		$.ajax({
			      			url: "http://localhost:8080/carRental/webapi/vehicles/" + data[f].id,
			      			type: "delete",
			      			success : function(data){
			      				location.reload();
			      			}
			      		});
					 });
			   	});
			  });
		 });
	 });
</script>
</html>