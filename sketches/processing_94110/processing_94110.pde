
int airports;
float dotSize, dotMax, dotMin, dotChange;
 
float[] airportLon;
float[] airportLat;

float lonHi, lonLo;
float latHi, latLo;
 
void setup() {
  size (960,800);
  smooth();
  noStroke();
 
  String dataLines[]=loadStrings("airports.csv");
  airports=dataLines.length;
 
  airportLon = new float [airports];
  airportLat = new float [airports];
 
  for (int counter=1;counter<airports;counter++) {
    String[] temp = split(dataLines[counter], ',');
    airportLat[counter]=float(temp[5]);
    airportLon[counter]=float(temp[6]);
  }
 
  dotSize=2;
  dotMax=3;
  dotMin=1;
  dotChange=0.05;
 
  fill(#F9FCAB);
}
 
void draw() {
  background(0);
  for (int n=1;n<airports;n++) { 
    float myX = map(airportLon[n], -170, 0, 150, width+300);
    float myY = map(airportLat[n], 10, 80, height-100, 0);
    ellipse (myX, myY, dotSize, dotSize);
  }

  doPulse();

}
 
void doPulse() {
  dotSize=dotSize+dotChange;
  if (dotSize>dotMax || dotSize<dotMin) {
    dotChange=dotChange*-1.0;
  }
}



