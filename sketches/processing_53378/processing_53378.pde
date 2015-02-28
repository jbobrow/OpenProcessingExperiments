
//Ned Prutzer
//Feb 17 Assignment

//Initialize quantities
int nasdaqQty;
int eaQty;
int whQty;
int actQty;
int sBuxQty;
int margeN;
int nasdaqDatemin=1;
int nasdaqDatemax=33;

//List Images
PImage nasdaqLogo;
PImage eaLogo;
PImage whLogo;
PImage actLogo;
PImage sBuxLogo;

//Floats
//January and February Close Values 
float [] nasdaqClose;
float [] eaClose;
float [] whClose;
float [] actClose;
float [] sBuxclose;

//Highs and lows
float nasdaqClosehi, nasdaqCloselo;
float eaClosehi, eaCloselo;
float whClosehi, whCloselo;
float actClosehi, actCloselo;
float sBuxclosehi, sBuxcloselo;

//Dots
float dotSize, dotMax, dotMin, dotChange;

//Set-up
void setup() {
  background(255);
  size (960, 720);
  smooth();
  noStroke();

  //Logos
  nasdaqLogo = loadImage("nasdaq.png");
  nasdaqLogo.resize(200,100);
  eaLogo = loadImage("ea.png");
  eaLogo.resize(200,100);
  whLogo = loadImage("wh1.png");
  whLogo.resize(200,150);
  actLogo = loadImage("act.png");
  actLogo.resize(250,150);
  sBuxLogo = loadImage("sBux.png");
  sBuxLogo.resize(200,200);

  //Array
  String dataLines[]=loadStrings("Feb_17.csv");
  nasdaqQty = dataLines.length;
  eaQty = dataLines.length;
  whQty = dataLines.length;
  actQty = dataLines.length;
  sBuxQty = dataLines.length;

  nasdaqClose = new float [nasdaqQty];
  eaClose = new float [eaQty];
  whClose = new float [whQty];
  actClose = new float [actQty];
  sBuxclose = new float [sBuxQty];

  //For loops
  for (int counter=0;counter<nasdaqQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    nasdaqClose[counter]=float(temp[0]);
  }

  for (int counter=0;counter<eaQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    eaClose[counter]=float(temp[1]);
  }

  for (int counter=0;counter<whQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    whClose[counter]=float(temp[2]);
  }

  for (int counter=0;counter<actQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    actClose[counter]=float(temp[3]);
  }

  for (int counter=0;counter<sBuxQty;counter++) {
    String[] temp = split(dataLines[counter], ',');
    sBuxclose[counter]=float(temp[4]);
  }

  //Max/Min
  //nasdaq
  nasdaqClosehi = max (nasdaqClose);
  nasdaqCloselo = min (nasdaqClose);
  
  //ea
  eaClosehi = max (eaClose);
  eaCloselo = min (eaClose);
  
  //wh
  whClosehi = max (whClose);
  whCloselo = min (whClose);
  
  //act
  actClosehi = max (actClose);
  actCloselo = min (actClose);
  
  //sBux
  sBuxclosehi = max (sBuxclose);
  sBuxcloselo = min (sBuxclose);
  
  //More dots...
  dotSize=9;
  dotMax=11;
  dotMin=8;
  dotChange=0.20;
  margeN=25;
  background(255);
  //And, DRAW!
}
void draw() {
  background(255);
  
  //Data
  nasdaq ();
  ea ();
  wh ();
  act ();
  sBux ();
  
  //Boxes
  nasdaqBox ();
  eaBox ();
  whBox ();
  actBox ();
  sBuxbox ();
}
//Nasdaq Points
  void nasdaq () {
    fill(#17A8FF);
    image (nasdaqLogo, 750, 0);
  for (int n=0;n<nasdaqQty;n++) { 
    float myX = map(nasdaqClose[n], nasdaqCloselo, nasdaqClosehi, height-margeN, margeN);
    ellipse(myX, 50, dotSize, dotSize);
  }
}

//Nasdaw Box
  void nasdaqBox () {
    fill(#17A8FF);
    stroke(1);
    strokeWeight(2);
    line (margeN, 50, 700, 50);
    rect (512, 25, 118, 50);
    rect (617, 25, 13, 50);  
  }

//EA Points
  void ea () {
    fill(#434343);
    image(eaLogo, 750, 100);
  for (int n=0;n<eaQty;n++) { 
    float myX = map(eaClose[n], eaCloselo, eaClosehi, height-margeN, margeN);
    ellipse(myX, 150, dotSize, dotSize);
  }
}

//EA Box
  void eaBox () {
    fill(#434343);
    line (margeN, 150, 700, 150);
    rect (350, 125, 268, 50); 
    rect (592, 125, 26, 50);
  }

//Whole Foods Points  
  void wh () {
    fill(#526F35);
    image(whLogo, 750, 225);
  for (int n=0;n<whQty;n++) { 
    float myX = map(whClose[n], whCloselo, whClosehi, height-margeN, margeN);
    ellipse(myX, 300, dotSize, dotSize);
  }
}

//Whole Foods Box
  void whBox() {
    fill(#526F35);
    line (margeN, 300, 700, 300);
    rect (245, 275, 230, 50); 
    rect (340, 275, 135, 50);
  }

//Activision Points  
  void act () {
    fill(#004276);
    image(actLogo, 715, 375);
  for (int n=0;n<actQty;n++) { 
    float myX = map(actClose[n], actCloselo, actClosehi, height-margeN, margeN);
    ellipse(myX, 450, dotSize, dotSize);
  }
}

//Activision Box
  void actBox () {
    fill(#004276);
    line (margeN, 450, 700, 450);
    rect (233, 425, 244, 50);
    rect (418, 425, 59, 50);
  }

//Starbucks Points  
  void sBux () {
    fill(#064D00);
    image(sBuxLogo, 760, 520);
  for (int n=0;n<sBuxQty;n++) { 
    float myX = map(sBuxclose[n], sBuxcloselo, sBuxclosehi, height-margeN, margeN);
    ellipse(myX, 625, dotSize, dotSize);
  }
}  

//Starbucks Box
  void sBuxbox () {
    fill(#064D00);
    line (margeN, 625, 700, 625);
    rect (160, 600, 188, 50);
    rect (298, 600, 50, 50);
  doPulse();
}

//Dots
void doPulse() {
  dotSize=dotSize+dotChange;
  if (dotSize>dotMax || dotSize<dotMin) {
    dotChange=dotChange*-1.0;
  }
}


