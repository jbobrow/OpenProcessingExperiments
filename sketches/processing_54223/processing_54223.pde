
//Ned Prutzer
//Feb 24 Assignment

//Note: Much of the code stems from Professor LeMasters' Starbucks sketch
//It is available for viewing on his openprocessing.org profile!
//My main intervention was setting the additional string
//Plus the code for the values and fills

//Initialize quantities
int siteQty; 
int margeN; 

//Floats
//Sites
float[] siteLon; 
float[] siteLat; 
String[] collectDesc; 

//Highs and Lows
float lonHi, lonLo; 
float latHi, latLo;

//Dots
float dotSize, dotMax, dotMin, dotChange;

//Set-up
void setup() {
  size (600, 720);
  smooth();
  noStroke();

  //Array
  String dataLines[]=loadStrings("LongLat_1.csv");
  siteQty = dataLines.length;
  //collectDesc = dataLines.length;
  siteLon = new float [siteQty];
  siteLat = new float [siteQty];
  collectDesc = new String [siteQty];

  //For loops
  for (int counter=0;counter<siteQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    siteLat[counter]=float(temp[0]);
    siteLon[counter]=float(temp[1]);
  }
  for (int counter=0;counter<siteQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    collectDesc[counter]=(temp[2]);
  }

  //Maxs/Mins
  //Maximums
  lonHi = max (siteLon); 
  latHi = max (siteLat);

  //Minimums
  latLo = min (siteLat); 
  lonLo = min (siteLon);
  //More dots...
  dotSize=9;
  dotMax=11;
  dotMin=8;
  dotChange=0.20;
  margeN=50;

  //And, DRAW!
}  
void draw() {
  background(255);
   doPulse();
  for (int s=0;s<siteQty;s++) { 
    float myX = map(siteLon[s], lonLo, lonHi, margeN, width-margeN);
    float myY = map(siteLat[s], latLo, latHi, height-margeN, margeN);
    //for (int c=0;c<siteQty;c++) {
    if (collectDesc[s].equals("ADDRESS MATCHING-HOUSE NUMBER")) {
      fill(#FF0000);
    }
    if (collectDesc[s].equals("INTERPOLATION-PHOTO")) {
      fill(#00FF00);
    }
    if (collectDesc[s].equals("INTERPOLATION-MAP")) {
      fill(#0000FF);
    }
    if (collectDesc[s].equals("UNKNOWN")) {
      fill(#FFFF00); 
    }
      ellipse (myX, myY, dotSize, dotSize);
    //doPulse();
    //docollectDesc();
  }
}
//Dots
void doPulse() {
  stroke(3);
  dotSize=dotSize+dotChange;
  if (dotSize>dotMax || dotSize<dotMin) {
    dotChange=dotChange*-1.0;
  }
}

