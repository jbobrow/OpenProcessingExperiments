
// Map Processing Lat/Long by Jo Wood
// http://forum.processing.org/topic/using-a-world-map-in-processing

// Base map customized from Shaded Relief
// http://www.shadedrelief.com/

PFont futura;
XMLElement xml;
PImage backgroundMap;

int i;
int start;
int startCount;

String delimiters = " ,";
String timeDelimiters = ":";
String stringDelimiters = " ,";
String earthquakeString[];
String splitTitle[];
String splitDate[];
String splitTime[];
String extractMagnitude[];
String extractDay[];
String extractMonth[];
String extractYear[];
String extractTime[];
String extractHour[];
String extractMin[];
String earthquakeTitle[];
String earthquakeLat[];
String earthquakeLong[];
String earthquakeDepth[];
String earthquakeDate[];

String largestTitle[];
String largestTitlePrint = " ";
float largestLat;
float largestLong;
float largestHue;

float eMag;
float eMagSize;
float eLat;
float eLong;
float eDepth;
float largestMag = 0;
float totalMag = 0;
float averageMag;

int eMonth;
int eDay;
int eHour;
int eMin;
int eYear;
int eCount = 0;

// Latitude Longitude Reference to Map Graphic for Mapping Coordinates
float mapGeoLeft   = -180;
float mapGeoRight  =  180;
float mapGeoTop    =   90;
float mapGeoBottom =  -90;

float mapScreenWidth, mapScreenHeight;  // Dimension of map in pixels.

void setup()
{
  size(1400, 700);
  colorMode(HSB, 360, 100, 100, 100); 
  smooth();
  noStroke();
  ellipseMode(CENTER);
  frameRate(10);

  //load background
  backgroundMap = loadImage("data/mapEditDark.jpg");
  mapScreenWidth  = width;
  mapScreenHeight = height;
  image(backgroundMap, 0, 0, mapScreenWidth, mapScreenHeight);

  //Titles and Current Time
  futura = loadFont("Futura-Medium-20.vlw"); 

  noStroke();
  //String now = day() + " " + month() + " " + year() + " " + hour() + ":" + minute();
  //text(now, 700, 660);

  //static XML file
  xml = new XMLElement(this, "data/xml.xml");
  
  //live feed
  //xml = new XMLElement(this, "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M2.5.xml");
  //println(xml);

  XMLElement[] earthquakes = xml.getChildren("channel/item");  // put all earthquakes into an array
  //println(earthquakes);
  start = earthquakes.length - 1;
  startCount = start;

  earthquakeTitle = new String[earthquakes.length];
  extractMagnitude = new String[earthquakes.length];
  earthquakeLat = new String[earthquakes.length];
  earthquakeLong = new String[earthquakes.length];
  earthquakeDepth = new String[earthquakes.length];
  earthquakeDate = new String[earthquakes.length];
  extractDay = new String[earthquakes.length];
  extractMonth = new String[earthquakes.length];
  extractYear = new String[earthquakes.length];
  extractTime = new String[earthquakes.length];
  extractHour = new String[earthquakes.length];
  extractMin = new String[earthquakes.length];
  largestTitle = new String[earthquakes.length];

  //println(earthquakes.length);

  for (int i=0; i < earthquakes.length; i++) {

    println(i);

    //TITLE
    XMLElement theTitle = earthquakes[i].getChild("title");  // get the title XML
    //println(theTitle);
    earthquakeTitle[i] = theTitle.getContent();
    println("Title = " + earthquakeTitle[i]);

    // MAGNITUDE
    // retrieve magnitude from title, using space as delimeter
    splitTitle = splitTokens(earthquakeTitle[i], delimiters);
    //println(splitTitle);
    extractMagnitude[i] = splitTitle[1];
    //println(extractMagnitude[i]);
    eMag = float(extractMagnitude[i]);
    println("Magnitude = " + eMag);

    // LATITUDE LOCATION
    XMLElement theLatitude = earthquakes[i].getChild("geo:lat");
    //println(theLatitude);
    earthquakeLat[i] = theLatitude.getContent();
    //println(earthquakeLat[i]);
    eLat = float(earthquakeLat[i]);
    println("Latitude = " + eLat);

    // LONGITUDE LOCATION
    XMLElement theLongitude = earthquakes[i].getChild("geo:long");
    //println(theLongitude);
    earthquakeLong[i] = theLongitude.getContent();
    //println(earthquakeLong[i]);
    eLong = float(earthquakeLong[i]);
    //make opposite
    println("Longitude = " + eLong);

    //DATE
    XMLElement theDate = earthquakes[i].getChild("pubDate");
    earthquakeDate[i] = theDate.getContent();
    println("Full Date = " + earthquakeDate[i]);

//    // EXTRACTIONS
//    splitDate = splitTokens(earthquakeDate[i], delimiters);
//    extractDay[i] = splitDate[1];
//    eDay = int(extractDay[i]);
//    println("Day = " + eDay);
//
//    extractMonth[i] = splitDate[2];
//    println("Month = " + extractMonth[i]);
//    if ( extractMonth[i].equals("Jan") ) {
//      eMonth = 1;
//    } 
//    else if ( extractMonth[i].equals("Feb") ) {
//      eMonth = 2;
//    } 
//    else if ( extractMonth[i].equals("Mar") ) {
//      eMonth = 3;
//    } 
//    else if ( extractMonth[i].equals("Apr") ) {
//      eMonth = 4;
//    } 
//    else if ( extractMonth[i].equals("May") ) {
//      eMonth = 5;
//    } 
//    else if ( extractMonth[i].equals("Jun") ) {
//      eMonth = 6;
//    } 
//    else if ( extractMonth[i].equals("Jul") ) {
//      eMonth = 7;
//    } 
//    else if ( extractMonth[i].equals("Aug") ) {
//      eMonth = 8;
//    } 
//    else if ( extractMonth[i].equals("Sep") ) {
//      eMonth = 9;
//    } 
//    else if ( extractMonth[i].equals("Oct") ) {
//      eMonth = 10;
//    } 
//    else if ( extractMonth[i].equals("Nov") ) {
//      eMonth = 11;
//    } 
//    else if ( extractMonth[i].equals("Dec") ) {
//      eMonth = 12;
//    }
//
//    println("Month Number = " + eMonth);
//
//    //YEAR
//    extractYear[i] = splitDate[3];
//    eYear = int(extractYear[i]);
//    println("Year = " + eYear);
//
//    //TIME
//    extractTime[i] = splitDate[4];
//    println("Time = " + extractTime[i]);
//
//    //HOUR EXTRACTION 
//    splitTime = splitTokens(extractTime[i], timeDelimiters);
//    extractHour[i] = splitTime[0];
//    eHour = int(extractHour[i]);
//    println("Hour = " + eHour);
//
//    //MINUTE EXTRACTION
//    extractMin[i] = splitTime[1];
//    eMin = int(extractMin[i]);
//    println("Minute = " + eMin);

    println(" ----- ");
  }

  println("Current Time = " + day() + " " + month() + " " + year() + " " + hour() + ":" + minute());
}


void draw() {

  //PVector for coordinate function
  PVector p;
  PVector m;

  textFont(futura, 20);

  //going through array in reverse
  if (startCount >= 0) {

    image(backgroundMap, 0, 0, mapScreenWidth, mapScreenHeight); 

    //cpanel
    fill(0, 0, 0, 100);
    rect(0, 620, 1400, 80);

    //TITLES 

    fill(357, 80, 75, 100);
    textFont(futura, 18);
    String title = "Past Seven Days of Earthquakes";
    text(title, 15, 644);

    fill(358, 0, 30, 100);
    textFont(futura, 12);
    String usgs = start + " M2.5+ Earthquakes / usgs.gov";
    text(usgs, 15, 661);
    String me = "Visualized by Jeff Vlahos";
    text(me, 15, 677.5);

    stroke(358, 0, 20, 100);
    line(273, 620, 273, 700);

    String timeTitle = "Time";
    text(timeTitle, 293, 644);

    String locationTitle = "Earthquake";
    text(locationTitle, 568, 644);

    fill(357, 80, 75, 100);
    String largest = "Largest Earthquakes M5.0+";
    text(largest, 955, 644);

    fill(358, 0, 30, 100);
    String average = "Average Magnitude";
    text(average, 1255, 644);

    //  String magnitudeTitle = "Magnitude";
    //  text(magnitudeTitle, 825, 644);

    line(940, 620, 940, 700);



    //new earthquake position
    eLat = float(earthquakeLat[startCount]);
    eLong = float(earthquakeLong[startCount]);
    p = geoToPixel(new PVector(eLong, eLat));

    //earthquake magnitude and size translation
    eMag = float(extractMagnitude[startCount]);

    eMagSize = eMag * 5;

    //earthquake hue mapping
    float eMagHue = map(eMag, 2.5, 9.5, 100, 0);

    //draw earthquake circle and opaque outer ring
    fill(eMagHue, 80, 80, 20);
    ellipse(p.x, p.y, eMagSize, eMagSize);
    noFill();
    strokeWeight(1);
    stroke(0, 0, 100, 10);
    ellipse(p.x, p.y, eMagSize * 1.25, eMagSize * 1.25);

    //refresh bar 1
    noStroke();
    fill(0, 0, 0, 100);
    rect(282, 649, 650, 51);

    //update date info for earthquake
    textFont(futura, 17);
    fill(0, 0, 100, 100);

    text(earthquakeDate[startCount], 293, 665);

    textLeading(20);
    text(earthquakeTitle[startCount], 570, 650, 350, 100);


    //past earthquake position
    for (int x = start; x > startCount; x--) {

      //earthquake position
      eLat = float(earthquakeLat[x]);
      eLong = float(earthquakeLong[x]);
      p = geoToPixel(new PVector(eLong, eLat));

      //earthquake magnitude and size translation
      eMag = float(extractMagnitude[x]);

      eMagSize = eMag * 5;

      //earthquake hue mapping
      eMagHue = map(eMag, 2.5, 9.5, 100, 0);

      //draw earthquake circle and opaque outer ring
      fill(eMagHue, 80, 80, 20);
      ellipse(p.x, p.y, eMagSize, eMagSize);
      noFill();
      strokeWeight(1);
      stroke(0, 0, 100, 5);
      ellipse(p.x, p.y, eMagSize * 1.25, eMagSize * 1.25);

      noStroke();
      fill(0, 0, 0, 100);
      rect(950, 649, 300, 51);
      fill(0, 0, 100, 100);

      //Largest Magnitude
      //can substitute a magnitude value as well and will highlight all above it
      if (eMag > largestMag && eMag > 5.0) {
        largestMag = eMag;
        largestTitle[x] = earthquakeTitle[x];
        largestTitlePrint = largestTitle[x];
        largestLat = p.x;
        largestLong = p.y;
        largestHue = eMagHue - 30;
      }
      
      noFill();
      strokeWeight(1);
      stroke(largestHue, 80, 80, 15);
      ellipse(largestLat, largestLong, eMagSize * 1.5, eMagSize * 1.5);
      noStroke();
      
      drawData(p.x, p.y, earthquakeTitle[x]);
    }//end for loop

    text(largestTitlePrint, 955, 650, 300, 100);

    //Average Magnitude Calculator
    totalMag = totalMag + eMag;
    eCount++;
    averageMag = totalMag / eCount;
    //println(eCount);

    fill(0, 0, 0, 100);
    rect(1250, 649, 150, 51);
    fill(0, 0, 100, 100);
    text(averageMag, 1250, 665);

    //subtract 1, next earthquake
    startCount--;
  } 
  else {
    delay(2500);
    startCount = start;
    largestMag = 0;
    eCount = 0;
    totalMag = 0;
  }
}

void drawData(float x, float y, String z) {

  if (dist(x, y, mouseX, mouseY) < 5) {
    //textAlign(CENTER);
    textFont(futura, 10);
    text(z, mouseX + 15, mouseY);
    textFont(futura, 17);
  }
}


// Converts screen coordinates into geographical coordinates. 
// Useful for interpreting mouse position.
public PVector pixelToGeo(PVector screenLocation)
{
  return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/mapScreenWidth, 
  mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/mapScreenHeight);
}

// Converts geographical coordinates into screen coordinates.
// Useful for drawing geographically referenced items on screen.
public PVector geoToPixel(PVector geoLocation)
{
  return new PVector(mapScreenWidth*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft), 
  mapScreenHeight - mapScreenHeight*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}


