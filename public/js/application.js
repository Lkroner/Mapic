

var map = L.map('map').setView([51.505, -0.09], 13);

L.tileLayer('http://{s}.tiles.mapbox.com/v3/lkroner.j9ino1jm/{z}/{x}/{y}.png', {
    maxZoom: 18
}).addTo(map);

var marker = L.marker([51.5, -0.09]).addTo(map);

var popup = L.popup();


function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
}

map.on('click', onMapClick);




var findImages = function (event) {
	event.preventDefault();

function ajaxGetImages = $.ajax({
	url: '/',
	type: 'POST',
	data: $(this).serialize()
})
.done(function(data) {
	console.log(data)
  });
};

function bindEvents() {
    $('#button').on('click', findImages);  
  }

bindEvents();


