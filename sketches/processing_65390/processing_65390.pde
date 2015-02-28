
import java.awt.event.*;
PFont font;
int timeBegin = 0;
int timeEnd = year() + 1;
int periodCenter = 1900;//Point in timeline on which to center view
int yearModulate = 10;
int zoomLevel = 40;

//Mouse Dragging
protected float   mX;
protected float mY;
protected float   mDifX = 0f;
//protected float   mDifY = 0f;

void setup() {
  size(800, 500);
  font = loadFont("Bebas-24.vlw");
  smooth();

  //CENTER ON SPECIFIED DATE
  mX = map(periodCenter, 0, timeEnd - timeBegin, width/2 - 200*zoomLevel, 200*zoomLevel)*-1;
  println(mX);

  addMouseWheelListener(new MouseWheelListener() { 
    public void mouseWheelMoved(MouseWheelEvent mwe) { 
      mouseWheel(mwe.getWheelRotation());
    }
  }
  );
}

void draw() {
  background(0);
  strokeWeight(20);
  stroke(100);
  line(0, height/2, width, height/2);

  mX = constrain(mX, width/2 - 200*zoomLevel, -width/2 + 200*zoomLevel);
  translate(mX, mY);

  for (int i = 0; i < timeEnd - timeBegin; i++) {
    float yearTick = map(i, 0, timeEnd - timeBegin, width/2 - 200*zoomLevel, width/2 + 200*zoomLevel);

    int upTick;
    if (zoomLevel < 15) yearModulate = 100;
    else if (zoomLevel < 50) yearModulate = 10;
    else if(zoomLevel < 120) yearModulate = 5;

    if (i%yearModulate == 0) {//Every tenth year make bold
      upTick = 60;
      fill(100);
      textAlign(RIGHT);
      textFont(font);
      pushMatrix();
      rotate(HALF_PI);
      text(i, height/2 + 60, -yearTick);
      popMatrix();
      strokeWeight(1);
    }
    else {
      strokeWeight(.5);
      upTick = 50;
    }

    noFill();
    line(yearTick, height/2 - upTick, yearTick, height/2 + upTick);
  }
}


void mouseWheel(int delta) {
  zoomLevel = zoomLevel + delta;
  zoomLevel = constrain(zoomLevel, 3, 150);
  println(zoomLevel);
}

void mousePressed() {
  mDifX = mouseX - mX;
  //mDifY = mouseY - mY;
  cursor(HAND);
}

void mouseReleased() {
  cursor(ARROW);
}

void mouseDragged() {
  mX = mouseX - mDifX;
  println(mX);
  //mY = mouseY - mDifY;
}


