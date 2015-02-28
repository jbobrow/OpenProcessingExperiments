
int quakeQty;
float dotSize,dotColor,dotMax, dotMin, dotChange;
int margeN = 0;
PImage worldmap;
PFont myTypeface;
float[] quakeLon;
float[] quakeLat;
float [] quakeMag;
float [] quakeDepth;
String [] quakeTime;
String [] quakeRegion;
float lonHi, lonLo;
float latHi, latLo;
float magHi, magLo;
float depthHi, depthLo;

void setup() {
  size (527, 287);
  smooth();
  worldmap = loadImage("worldmap.jpg");
  myTypeface = loadFont("EurostileBold-32.vlw");
  String dataLines[]=loadStrings("http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt");
  quakeQty=dataLines.length;
  quakeLon = new float [quakeQty];
  quakeLat = new float [quakeQty];
  quakeMag = new float [quakeQty];
  quakeDepth = new float [quakeQty];
  quakeTime = new String [quakeQty];
  quakeRegion = new String [quakeQty];
 
  for (int counter=1;counter<quakeQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    quakeLon[counter]=float(temp[7]);
    quakeLat[counter]=float(temp[6]);
    quakeMag[counter]=float(temp[8]);
    quakeDepth[counter]=float(temp[9]);
    quakeTime[counter]=temp[3]+temp[4]+temp[5];
    quakeRegion[counter]=temp[11];
  }
  lonHi = max (quakeLon);
  lonLo = min (quakeLon);
  latHi = max (quakeLat);
  latLo = min (quakeLat);
  magHi = max (quakeMag);
  magLo = min (quakeMag);
  depthHi = max (quakeDepth);
  depthLo = min (quakeDepth);
  dotMax = dotSize+5;
  dotMin = dotSize-5;
  dotChange = .2;
}
 
void draw() {
  background(255);
  image(worldmap,0,0);
  for (int n=0;n<quakeQty;n++) { 
    float myX = map(quakeLon[n], lonLo, lonHi, margeN-25, width-margeN-10);
    float myY = map(quakeLat[n], latLo, latHi, height-margeN-25, margeN+25);
    float dotSize = map(quakeMag[n],magLo,magHi, 5, 50);
    float colorPercent = norm(quakeDepth[n],depthLo,depthHi);
    color dotColor = lerpColor(#2e8b57,#adff2f,colorPercent);
    //set color to depth
    //the closer to surface, the deeper
    //norm() and lerp() together make up the map() function
    noStroke();
    fill(dotColor,dotSize+50);
    ellipse (myX, myY, dotSize, dotSize);
    if (dist(mouseX,mouseY,myX,myY)<2){
      fill(#ffd700,dotSize+50);
      ellipse(myX,myY,dotSize,dotSize);
      fill(#ff4500);
      point(myX,myY);
      textFont(myTypeface,12);
      textAlign(LEFT);
      text(quakeRegion[n] + quakeTime[n],myX+dotSize,myY,150,70);
    }
  doPulse();
  }
}
 
void doPulse() {
  dotSize=dotSize+dotChange;
  if (dotSize>dotMax || dotSize<dotMin) {
    dotChange=dotChange*-1.0;
  }
}

