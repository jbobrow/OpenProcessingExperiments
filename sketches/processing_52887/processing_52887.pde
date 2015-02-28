
int sBuxQty;
float dotSize, dotMax, dotMin, dotChange;
int margeN;
PImage sBuxLogo;

float[] sBuxLon;
float[] sBuxLat;

float lonHi, lonLo;
float latHi, latLo;

void setup() {
  size (960, 720);
  smooth();
  noStroke();
  
  sBuxLogo = loadImage("logo.png");

  String dataLines[]=loadStrings("Starbucks_PalinFree.csv");
  sBuxQty=dataLines.length;

  sBuxLon = new float [sBuxQty];
  sBuxLat = new float [sBuxQty];

  for (int counter=0;counter<sBuxQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    sBuxLon[counter]=float(temp[0]);
    sBuxLat[counter]=float(temp[1]);
    // and we ignore temp[2] altogether
  }

  lonHi = max (sBuxLon);
  lonLo = min (sBuxLon);
  latHi = max (sBuxLat);
  latLo = min (sBuxLat);
  dotSize=4;
  dotMax=6;
  dotMin=3;
  dotChange=0.20;
  margeN=25;

  fill(5,96,50,48);
}

void draw() {
  background(255);
  image(sBuxLogo,width-margeN-85,height-margeN-85);
  for (int n=0;n<sBuxQty;n++) {  
    float myX = map(sBuxLon[n], lonLo, lonHi, margeN, width-margeN);
    float myY = map(sBuxLat[n], latLo, latHi, height-margeN, margeN);
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


