
//This is an original program that creates random rectangles 
//by drawing random lengths, widths, strokeWidths, 
//X and Y coordinates, and fill or noFill.
//
//Written by Karen Lo, LWHS 2014

float strokeWidth;
float angle;
float newLength;
float newWidth;
float originX;
float originY;

void setup() {
  size (700, 400);
  smooth();
  background(255);
  fill(0);
}

void draw() {
  for (int i = 1; i < 11; i++) {
    drawRandomRectangle();
  }
}

void drawRandomRectangle() {
  randomStrokeWidth();
  randomOriginX();
  randomOriginY();
  randomLength();
  randomWidth();
  fillOrNoFill();
  strokeWeight(strokeWidth);
  rotate(angle);
  rect(originX, originY, newWidth, newLength);
}

void randomOriginX() {
  float x = random(1, width-10);
  originX = x;
  noLoop();
}

void randomOriginY() {
  float x = random(1, height-10);
  originY = x;
  noLoop();
}

void randomWidth() {
  float x = random(5, (width-30)-originX);
  newWidth = x;
  noLoop();
}

void randomLength() {
  float x = random(5, (height-30)-originY);
  newLength = int(x);
  noLoop();
}

void spin() {
  float x = random(20);
  angle = mouseY + int(x);
  noLoop();
}

void randomStrokeWidth() {
  float x = random(5,15);
  strokeWidth = int(x);
  noLoop();
}

void fillOrNoFill() {
  float y = random(10);
  println("area = " + newWidth*newLength);
  println((width*height)/15);
  println(y);
  if (y>=5.0) {
    if (newWidth*newLength < (width*height)/15) {
      fill(0);
      println("fill");
    } 
    else {
      noFill();
    }
  } 
  else {
    noFill();
  }
  noLoop();
}

void mouseClicked() {
  background(255);
  redraw();
}

