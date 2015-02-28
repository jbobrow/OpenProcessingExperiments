
int numCurves = 5;
ArrayList<MyCurve> CurveList;
 
boolean letsPaint = false;
int strokeAlpha = 255;
 
boolean showPoints = false;
 
int nestedCurves = 1;
 
void setup() {
  size(640, 360);
  background(#FFFFFF);
  smooth();
  frameRate(60);
 
  CurveList = new ArrayList<MyCurve>();
 
  for (int i = 0; i<numCurves; i++) {
    CurveList.add( new MyCurve() );
  }
}
 
void draw() {
  if (!letsPaint) background(#FFFFFF);
  for (MyCurve animCurve : CurveList) {
    animCurve.display();
  }
}
 
void mousePressed() {
  background(#FFFFFF);
  for (MyCurve animCurve : CurveList) {
    animCurve.randomNums();
  }
}
 
void keyPressed() {
  if (key == ' ') {
    showPoints = false;
    if (letsPaint) {
      letsPaint = false;
      strokeAlpha= 255;
    } else {
      background(#FFFFFF);
      letsPaint = true;
      strokeAlpha = 10;
    }
  }
  if (key == 'p') {
    if (showPoints) {
      showPoints = false;
    } else {
      showPoints = true;
     }
  }
  if (key == '+') {
    nestedCurves++;
  }
  if (key == '-') {
    nestedCurves--;
    if (nestedCurves<=1) nestedCurves=1;
  }
}
 
class MyCurve {
 
  float ranX, ranY;
  float c, s;
  float angle;
  float speed;
  float radi;
  float y1, y2;
 
  int curveSpacing = 20;
 
  MyCurve() {
    angle = 0.0;
    speed = 0.02;
    radi  = ((int)random(5) * 25) + 100;
    randomNums();
  }
 
  void randomNums() {
    ranX = random(1) + 0.5;
    ranY = random(2) + 0.5;
    y1 = (int)random(height);
    y2 = (int)random(height);
  }
 
  void display() {
    noFill(); stroke(#000000, strokeAlpha);
       
    c = cos(angle);
    s = sin(angle/ranX);
 
    for (int i = 0; i<nestedCurves; i++){
      float yPos1 = y1 + (i*curveSpacing) + (c * radi);
      float yPos2 = y2 + (i*curveSpacing) - (c * radi);
 
      PVector pt1 = new PVector(
        (width  / 3) + (cos(angle) * radi),
        (height / 2) + (sin(angle/ranY) * radi)
      );
 
      PVector pt2 = new PVector(
        ((width / 3) + (cos(angle/ranX) * radi)) * 2,
        (height  / 2) + (sin(angle) * radi)
      );
 
      bezier(-10, yPos1, pt1.x, pt1.y, pt2.x, pt2.y, width+10, yPos2);
 
      if(showPoints && !letsPaint) {
        stroke(#333333);
 
        // left bezier handles
        fill(#333333); rect(pt1.x, pt1.y, 3, 3);
        textSize(9); fill(#FF0000); text("pt1.x - " + (int)pt1.x, pt1.x + 5, pt1.y + 3); fill(#CC0000); text("pt1.y - " + (int)pt1.y, pt1.x + 5, pt1.y + 15);
 
        // right bezier handles
        fill(#333333); rect(pt2.x, pt2.y, 3, 3);
        textSize(9); fill(#0000FF); text("pt2.x - " + (int)pt2.x, pt2.x + 5, pt2.y + 3); fill(#0000CC); text("pt2.y - " + (int)pt2.y, pt2.x + 5, pt2.y + 15);
 
        noFill();
      }
    }
    angle+=speed;
  }
}
