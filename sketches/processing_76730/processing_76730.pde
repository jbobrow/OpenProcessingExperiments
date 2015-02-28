
/* @pjs crisp=true; 
preload="openflights.png"; 
 */


HashMap airports;
// data for flights, can also be read from a file
String[] lines = { "LHR\tVIE", "VIE\tLJU", "LJU\tLGW", "LHR\tORD", "ORD\tSFO", "SFO\tLHR"};
int index = 0;
float oldx = 0;
float oldy = 0;
Flight myFlight;

String imageFajl = "openflights.png";
int xOffset = 512;  // x offset to longitude 0
int yOffset = 256;  // y offset to lattitude 0
int xSize = 1024;
int ySize = 513;
float xFactor = 2.84;  // scaling to fit 360 into the width of the image
float yFactor = 2.85;  // scaling to fit 180 into the height of the image

float distance = 0;
float total = 0;

color c1 = color(255);
color c2 = color(255);
color c3 = color(128,128,200);

PImage bg;
PFont f;


void setup() {
  size(1024 , 513);
  bg = loadImage(imageFajl);
  background(bg);
  f = createFont("Tahoma", 10); 
  textFont(f);
  //frameRate(10);   // 
  // Load airports
  airports = readAirportCodes("airports.txt");

  // Flight data
  // Format: tab delimited text file with each line containing two airport codes, origin and destination
  // you can load flight data from a file:
  // lines = loadStrings("data.txt");
  
}

void draw() {
  
// draw the lines  
  if (index < lines.length) {
    String[] pieces = split(lines[index], '\t');
    if (pieces.length == 2) {
      // read both airport codes
      String one = getAirport(pieces[0], airports);
      String two = getAirport(pieces[1], airports);
      
      // draw only if both airports exist 
      if ((one != null) & (two != null)) {
      String[] oneItems = split(one, '\t');
      String[] twoItems = split(two, '\t');
      
      float y = -(float(oneItems[6])) * yFactor + yOffset;
      float x = (float(oneItems[7])) * xFactor + xOffset;
      float y2 = -(float(twoItems[6])) * yFactor + yOffset;
      float x2 = (float(twoItems[7])) * xFactor + xOffset;
      float v = abs(x2-x)/3;      
      if (oldx == 0) {
          oldx = x;}
      if (oldy == 0) {
          oldy = y;}
          
         
      stroke(50,40,128,0);
      fill(128,128,128,180);
      strokeWeight(1);
      ellipse(x,y,4,4);
      ellipse(x2,y2,4,4);
      stroke(c2);
      
      stroke(0);
      fill(0);
      text(oneItems[3], x-4,y+11);
      text(twoItems[3], x2-4,y2+11);
      fill(180,180,200);
      text(oneItems[3], x-5,y+12);
      text(twoItems[3], x2-5,y2+12);

      
      c1 = color(128 + random(128),20,0,200);
      if (x > x2) {c1 = color(128,40 + random(128),0,200);}
      c3 = color(80,20,10,30);

      // Flight (color cst, color cft, float x1t, float y1t, float x2t, float y2t, float vxt, boolean vxdt, float vyt, boolean vydt, float rxt, boolean rxdt, float ryt, boolean rydt, float wt) {

      myFlight = new Flight(c1,c3, x,y,x2,y2,5, false, abs(x2-x)/3, false, 5, true, 5, true, 2);
      myFlight.display();
      
      oldx = x2;
      oldy = y2;      
      }     
    }
    // Go to the next line for the next run through draw()
    index = index + 1;
  }
}


String getAirport(String airportCode, HashMap airportLookup) {
String giveAirport = null;
// returns coordinates of the airport
// airportCode =  IATA code for the airport
// airportLookup = HashMap with codes
// if airport code is not fount it will reutrn  null
  if (airportLookup.containsKey(airportCode)) {
  giveAirport = airportLookup.get(airportCode).toString();
  }
  return giveAirport;
}

HashMap readAirportCodes(String fileName) {
  int index = 0;
  HashMap airportLookup = new HashMap();
  String koda;
  // reads the file with airport codes
  String[] lines = loadStrings(fileName);
  // reads all lines and  v hashmap airportLookup
  while (index < lines.length) {
    String[] singleLine = split(lines[index], '\t');
    koda = singleLine[0].toString();
    
    if (koda.length() == 3) {
        airportLookup.put(singleLine[0], lines[index]);
    }
    index = index + 1;   
  }
  return airportLookup;
}

class Flight {
color cs;      // Colour of the stroke
color cf;      // Colour for the fill
float x1;      // Start point of the curve  
float y1;
float x2;      // End point of the curve
float y2;
float vx;      // x curvature
boolean vxd;   // direction of curvature true = +, false = -
float vy;      // y curvature
boolean vyd;   // direction of curvature true = +, false = -
float rx;      // random curvature deviation
boolean  rxd;  // direction of random movement true = +, false = -
float ry;      // random curvature deviation
boolean  ryd;  // direction of random movement true = +, false = -
float w;       // Stroke weight
float xcp1,ycp1,xcp2,ycp2 = 0;   // calculated bezier control points

Flight (color cst, color cft, float x1t, float y1t, float x2t, float y2t, float vxt, boolean vxdt, float vyt, boolean vydt, float rxt, boolean rxdt, float ryt, boolean rydt, float wt) {
cs = cst;
cf = cft;
x1 = x1t;  
y1 = y1t;
x2 = x2t;
y2 = y2t;
vx = vxt;
vxd = vxdt;
vy = vyt;
vyd = vydt;
rx = rxt;
rxd = rxdt;
ry = ryt;
ryd = rydt;
w = wt;
}

void display() {
fill(cf);
stroke(cs);
strokeWeight(w);

// Set bezier control points
if (vxd) {
  xcp1 = x1 + vx;
  xcp2 = x2 + vx;  
  }
  else {
  xcp1 = x1 - vx;
  xcp2 = x2 - vx;
  }
if (rxd) {
  xcp1 = xcp1 + random(rx);
  xcp2 = xcp2 + random(rx);
  }
  else {
  xcp1 = xcp1 - random(rx);
  xcp2 = xcp2 - random(rx);
  }

if (vyd) {
  ycp1 = y1 + vy;
  ycp2 = y2 + vy;
  }
  else {
  ycp1 = y1 - vy;
  ycp2 = y2 - vy;
  }
if (ryd) {
  ycp1 = ycp1 + random(ry);
  ycp2 = ycp2 + random(ry);
  }
  else {
  ycp1 = ycp1 - random(ry);
  ycp2 = ycp2 - random(ry);
  }

// draw the curve
bezier(x1,y1,xcp1,ycp1,xcp2,ycp2,x2,y2);
  
}  
}


