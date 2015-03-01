

import java.util.*;

Date timeStamp;
Calendar myCalendar;
Calendar now = Calendar.getInstance();

String myURL;
JSONObject myJSONObject;
JSONArray stations; 

float mapGeoLeft   =  -74.14;          // Longitude 
float mapGeoRight  =  -73.86;          // Longitude
float mapGeoTop    =   40.80; //42.4085;          // Latitude 72 degrees north.
float mapGeoBottom =   40.66; //42.30651;          // Latitude 56 degrees south.

void setup() {

  size(1000, 700, P3D);
  blendMode(ADD);
  myURL = "http://www.citibikenyc.com/stations/json";


}
void draw() {
  background(0);
  myJSONObject = loadJSONObject(myURL);
  stations = myJSONObject.getJSONArray("stationBeanList");


  for (int i = 0; i < stations.size (); i++) {   
    JSONObject station = stations.getJSONObject(i); 

    float latitude = station.getFloat("latitude");
    float longitude = station.getFloat("longitude");
    int availableBikes = station.getInt("availableBikes");


    PVector p = geoToPixel(new PVector(longitude, latitude));
    float xCor = p.x;
    float yCor = p.y;

    noStroke();
    fill(180, 180, 120, 60);
    ellipse(p.x, p.y, 8, 8); 

    stroke(170, 170, 120, 40);
    fill(150, 150, 120, 30);
    camera(width/3-10, height, 300, width/2+150, height/2, 80, 0.0, 0.0, -1.0);
    for (int j = 0; j < availableBikes*7; j+=2) {
      pushMatrix();
      translate(0, 0, j);
      ellipse(p.x, p.y, 10, 10);
      popMatrix();
    }
  }
  fill(0);
  stroke(0);
  //text("x: " + 1.0*mouseX/100.0 + ", y: " + 1.0*mouseY/100.0, 10, 30);
  println("x: " + mouseX + ", y: " + mouseY);
}



// Converts geographical coordinates into screen coordinates.
// Useful for drawing geographically referenced items on screen.
public PVector geoToPixel(PVector geoLocation)
{
  return new PVector(width*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft), 
  height - height*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}

