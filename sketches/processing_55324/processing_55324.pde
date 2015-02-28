
/*
Method used: Till Nagel's tutorial on using TileMill for Processing:
http://tillnagel.com/2011/06/tilemill-for-processing/
*/
PImage map;
MercatorMap mercatorMap;

void setup() {
  size(1024, 801);
  frameRate(30);
  smooth();

  // load map image and set lat lon boundaries to those you exported in TileMill
  map = loadImage("USMap.png");  // exported with these boundaries (lon/lat/lon/lat): -132.3633, 14.4347, -58.3594, 57.7979
  
  // the map was exported with these boundaries:
  float lon1 = -132.3633;
  float lat1 = 14.4347;
  float lon2 = -58.3594;
  float lat2 = 57.7979;
  
  /*
  create MercatorMap object to set the bounding area of the map and position the POI
  this(mapScreenWidth, mapScreenHeight, DEFAULT_TOP_LATITUDE, DEFAULT_BOTTOM_LATITUDE, DEFAULT_LEFT_LONGITUDE, DEFAULT_RIGHT_LONGITUDE);
  */
  mercatorMap = new MercatorMap(1024, 801, lat2, lat1, lon1, lon2); // note the inversion of lat1 and lat2! this is due to the y-origin being at the top of the sketch

}

void draw() {
  // display map image
  image(map, 0, 0);
  
  PVector sanFrancisco = mercatorMap.getScreenLocation(new PVector(37.8f, -122.4f));
  fill(255, 200);
  ellipse(sanFrancisco.x, sanFrancisco.y, 20, 20);
}

