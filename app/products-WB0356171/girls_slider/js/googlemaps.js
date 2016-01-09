$(function() {

	var latlng = new google.maps.LatLng(57.0442, 9.9116);
	var settings = {
		zoom: 15,
		scrollwheel: false,
		center: latlng,
		mapTypeControl: true,
		mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
		navigationControl: true,
		navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
		mapTypeId: google.maps.MapTypeId.ROADMAP};
	var map = new google.maps.Map(document.getElementById("map_canvas"), settings);
	var contentString = '<div style="color: black">'+
		'<h4>Ember</h4>'+
		'</div>';
	var infowindow = new google.maps.InfoWindow({
		content: contentString
	});
	
	var companyImage = new google.maps.MarkerImage('http://maps.google.com/mapfiles/marker_orange.png',
		new google.maps.Size(20,34),
		new google.maps.Point(0,0),
		new google.maps.Point(50,50)
	);

	var companyShadow = new google.maps.MarkerImage('http://maps.google.com/mapfiles/shadow50.png',
		new google.maps.Size(40,34),
		new google.maps.Point(0,0),
		new google.maps.Point(50, 50));

	var companyPos = new google.maps.LatLng(57.0442, 9.9116);

	var companyMarker = new google.maps.Marker({
		position: companyPos,
		map: map,
		icon: companyImage,
		shadow: companyShadow,
		title:"Ember",
		zIndex: 3});

	google.maps.event.addListener(companyMarker, 'click', function() {
		infowindow.open(map,companyMarker);
	});

});