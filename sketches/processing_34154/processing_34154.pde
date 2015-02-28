
import processing.pdf.*;

float picY = 500;
float goldenRatio = 1.6180339887; 
float picX = picY * goldenRatio;

GoldenArc mainArc;
GoldenArc[] arcArray = new GoldenArc[0];

int arcsToDraw = 1000;
int currentArcs = 0; // Counter for recursion
float recursionScaleDivisor = 1.2; //1.20
float recursionPercentageChange = 30.0;
float recursionRotationDegrees = 25.0; // 40
float goldenArcOffset = -65; // Controls position of the top portion of the arc -63.3 is default
float goldenArcEnd = 240; // Controls position of the bottom portion of the arc 0 is default
float defaultStrokeWeight = picY * 0.116666667;
int initialSeed = 4934;

boolean useSolidColor = false;
color solidColor = #FFFFFF;
color[] colorArray = new color[0];

boolean pause = false;

PFont f;
PFont g;

void setup() {
  size((int)picX, (int)picY);//, PDF, "file.pdf");
  background(255);
  smooth();
  frameRate(30);
  f = loadFont("Monaco-10.vlw");
  g = loadFont("Helvetica-Bold-24.vlw");

  randomSeed(initialSeed);

  createColorArray();
  mainArc = new GoldenArc(0, 0, 1.0, 0.0, false, true);
  arcArray = (GoldenArc[])append(arcArray, mainArc);
}

void draw() {
  if (pause == false) {
    background(255);

    for (int i = 0; i < arcArray.length; i++) {
      arcArray[i].display();
    }

  /* noFill();
  strokeWeight(1);
  stroke(155);
  rectMode(CORNER);
  float xSize = 50;
  float ySize = xSize/goldenRatio;
  rect(10,picY - (10 + ySize),xSize,ySize);
  line(10 + ySize, picY - (10 + ySize), 10 + ySize, picY - 10);
  */
  
  
  }

  pause = true;
 // exit();
}

void createColorArray() {
  colorArray = (color[])append(colorArray, color(#D40000));
  colorArray = (color[])append(colorArray, color(#FF3800));
  colorArray = (color[])append(colorArray, color(#B31B1B));
  colorArray = (color[])append(colorArray, color(#F94D00));
  colorArray = (color[])append(colorArray, color(#FF7E00));
  colorArray = (color[])append(colorArray, color(#FF2400));
  colorArray = (color[])append(colorArray, color(#E48400));
}

void drawGoldenGrid() {
  stroke(150);
  strokeWeight(1);
  line(picY, 0, picY, picY);
  line(picY/2, picY, picY, 0);
}

color chosenSolidColor() {
  if (useSolidColor == false) {
    int colorIndex = (int)random(colorArray.length);
    solidColor = colorArray[colorIndex];
  }
  return solidColor;
}


