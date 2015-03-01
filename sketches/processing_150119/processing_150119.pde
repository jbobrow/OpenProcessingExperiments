
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/1126*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
"Coralizando" by Frederick van Amstel
"Machinography" original code by Peter_K 
Using Geomerative library by Ricard Marxer:
http://www.ricardmarxer.com/processing/geomerative/documentation/
which is released under GNU GPL
*/

import geomerative.*;

float   ellWidth     = 10;
float   ellHeight    = 10;
float   opacity      = 80;
int     segmentator  = RCommand.UNIFORMLENGTH;// UNIFORMSTEP ADAPTATIVE UNIFORMLENGTH
float   segmentStep  = 10;

int sx = 900;
int sy = 600;
String message = "Coralizando";

PGraphics pg; //create the off-screen graphics

RPoint[] points;
int[] col;
int[] currCol;
int[] rnd;

int[] randomizeArray(int[] model, int[] mask) {
  int[] result;
  result = new int[model.length];
  for (int i=0;i<model.length;i++){
    if (mask[i]==1) {
      result[i] = int(random(model[i]));
    } else {
      result[i] = model[i];
    }
  }
  return result;
}

void setup() {
  size(900,600);
  pg = createGraphics(900,600, JAVA2D);
  pg.beginDraw();
  pg.colorMode(HSB,360,360,10);
  pg.endDraw();
  background(255);  
  points = pixelize(message, segmentator, segmentStep);
  for (int i=0;i<points.length;i++) {
    points[i].x += sx/2;
    points[i].y += sy/2;
  }
  col = new int[3];
  rnd = new int[3];
  currCol = new int[3];
}

void initializeColors() {
  for (int i=0;i<3;i++) {
    col[i] = int(random(256));
    rnd[i] = int(random(2))+1;
  }
}

void draw() {
  int i = int(random(points.length-1));
  currCol = randomizeArray(col, rnd);
  background(255);  
  
  pg.beginDraw();
  pg.stroke(mouseX,mouseY,mouseX,frameCount%(sx));
  pg.fill(mouseX-100,mouseY-100,mouseX-100, frameCount%(sx)/2);
  ellWidth = (abs(mouseX-pmouseX) + abs(mouseY-pmouseY))/7;
  ellHeight = (abs(mouseX-pmouseX) + abs(mouseY-pmouseY))/7;
  if (ellWidth > 10 ) {
    ellWidth = ellHeight = 5;
  }
  pg.rect(points[i].x, points[i].y, ellWidth, ellHeight);
  pg.endDraw();
  image(pg,0,0);
}

void keyPressed () {
  if (key == 'r' || key == 'R') {
    //background(360);
    // doesn' work in Javascript mode
    //pg.clear();
  }
  if (key == 's' || key == 'S') {
    print("Saved file");
    pg.save("coralizando.png");
  }
}

/*
Using Geomerative library by Ricard Marxer:
http://www.ricardmarxer.com/processing/geomerative/documentation/
which is released under GNU GPL.

Featuring "anna" font by k-type.
*/

import geomerative.*;

String  FONT                 = "Oaxaquena_Tall.ttf";
int     MARGIN               = 50;
float   DEFAULT_SEGMENT_STEP = 0.4;
int     DEFAULT_SEGMENTATOR  = RCommand.UNIFORMLENGTH;// UNIFORMSTEP ADAPTATIVE UNIFORMLENGTH

RPoint[] pixelize(String message) {
  return pixelize(message, DEFAULT_SEGMENTATOR, DEFAULT_SEGMENT_STEP);
}

RPoint[] pixelize(String message, int segmentator) {
  return pixelize(message, segmentator, DEFAULT_SEGMENT_STEP);
}

RPoint[] pixelize(String message, int segmentator, float segmentStep) {
  RPoint[] result;  
  RFont f;
  RGroup gr;
  
  f = new RFont(this, FONT, 400, RFont.CENTER);
  gr = f.toGroup(message);
  
  RCommand.setSegmentStep(segmentStep);
  RCommand.setSegmentator(segmentator);
  
  gr = gr.toPolygonGroup();
  gr.centerIn(g, MARGIN, 1, 1);
  
  result = gr.getPoints();
  
  return result;
}



