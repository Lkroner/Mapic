
// If you need to find out the latitude and longitude of an 
// address using the Google Maps API, you need to use the Google Maps Geocoding Service:


var map = new GMap2(document.getElementById("map_canvas"));
var geocoder = new GClientGeocoder();

var address = "1600 Amphitheatre Parkway, Mountain  View";
geocoder.getLatLng(address, function(point) {
         var latitude = point.y;
         var longitude = point.x;  

         // do something with the lat lng
    });


// If you would like to get the latitude and longitude of a position clicked 
// on your Google map, you can do this in the click event:



GEvent.addListener(map, "click", function(marker,point) {
        var latitude = point.y;
        var longitude = point.x;

        // do something with the lat/lng
    });
