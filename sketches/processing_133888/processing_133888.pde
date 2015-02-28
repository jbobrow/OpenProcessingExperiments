
// HW #5
// Written by Kevin Kuntz
// Andrew ID: kkuntz
// © Kevin Kuntz  January 2014 Pittsburgh, Pa 15213  All Rights reserved

//variables
int canvasSize = 400;
float diameter = .2 * canvasSize;
float radius = .5 * diameter;
float increment1 = 5;
float increment2 = 10;
float x1 = 0 + radius;
float y1 = 0 + radius;
float x2 = 0 + radius;
float y2 = 0 + radius;


//canvas information
void setup() {
  size(canvasSize,canvasSize);
}

//movement
void moveFigures() {
  moveFigureA();
  moveFigureB();
}

void moveFigureA() {
  //moving across top
  if (y1 <= 0 + radius) {
    if (x1 > 0 + radius | x1 == 0 + radius) {
      if (x1 >= canvasSize - radius){
        x1 = canvasSize - radius;
        y1 += increment1;
      }
      else x1 += increment1;
    }
  }
  //moving across bottom
  else if (y1 >= canvasSize - radius) {
    if (x1 > 0 + radius) {
      x1 -= increment1;
      y1 = canvasSize - radius;
    }
    else if (x1 <= 0 + radius) {
      x1 = 0 + radius;
      y1 -= increment1;
    }
  }
  //moving down
  else if (y1 > 0 + radius & x1 == canvasSize - radius) {
    y1 += increment1;
  }
  //moving up
  else if  (y1 > 0 + radius & x1 == 0 + radius) {
    y1 -= increment1;
  }
}

void moveFigureB() {
 //moving across top
  if (y2 <= 0 + radius) {
    if (x2 > 0 + radius | x2 == 0 + radius) {
      if (x2 >= canvasSize - radius){
        x2 = canvasSize - radius;
        y2 += increment2;
      }
      else x2 += increment2;
    }
  }
  //moving across bottom
  else if (y2 >= canvasSize - radius) {
    if (x2 > 0 + radius) {
      x2 -= increment2;
      y2 = canvasSize - radius;
    }
    else if (x2 <= 0 + radius) {
      x2 = 0 + radius;
      y2 -= increment2;
    }
  }
  //moving down
  else if (y2 > 0 + radius & x2 == canvasSize - radius) {
    y2 += increment2;
  }
  //moving up
  else if  (y2 > 0 + radius & x2 == 0 + radius) {
    y2 -= increment2;
  }
}

//Figure Drawing
void drawFigure(float x,float y) {
  fill(255);
  noStroke();
  ellipse(x,y,diameter,diameter);
}

//create the motion blur
void prepWindow() {
  rectMode(CORNER);
  fill(8,70,155,10);
  rect(0,0,width,height);
}



void drawFigures() {
  drawFigure(x1, y1);
  drawFigure(x2, y2);
}

void draw() {
  prepWindow();
  moveFigures();
  drawFigures();
}
