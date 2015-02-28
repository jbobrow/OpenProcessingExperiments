
// Oliver Haimson 
// Assignment 06E
// Copyright 2012

float r, x, y, minValue, hrValue, randC;
boolean initialMins, initialHr;
int prevSec;

void setup() {
  size(500, 500);
  smooth();
  background(68, 76, 47);
  strokeJoin(ROUND);
  r=width-50;
  x=width/2;
  y=height/2;
  initialMins=true;
  initialHr=true;
  minValue=minute();
}

void draw() {
  checkHours();
  checkMins();
  drawSecs();
}

void drawSecs() {
  int sec = second();
  float inc3 = (360/60);
  if (prevSec!=sec){
    background(68, 76, 47);
    drawMins();
    drawBackgroundCircle();
    drawHours();
  }
  prevSec=sec;
}

void drawTriangle() {

}

void checkHours() {
  if (initialHr) {
    hrValue=hour();
    initialHr=false;
  }
  else {
    if (hour() != hrValue) {
      hrValue=hour();
    }
  }
}

void drawHours() {
  noFill();
  float h = hrValue;
  float inc = (r-10)/h;
  if (h > 0){
  for (int i=10; i<(r-10); i+=inc) {
    strokeWeight(random(1, 3));
    stroke(random(150, 170), random(120, 142), random(87, 113));
    ellipse(x, y, i+random(-.3, .3), i+random(-.3, .3));
  }
  }
}

void checkMins() {
  if (initialMins) {
    drawBackgroundCircle();
    minValue=minute();
    initialMins=false;
  }
  else {
    if (minute() != minValue) {
      drawBackgroundCircle();
      minValue=minute();
    }
  }
}

void drawBackgroundCircle() {
  stroke(140, 122, 100);
  fill(221, 194, 171);
  strokeWeight(5);
  ellipse(x, y, r, r);
}

void drawMins() {
  strokeWeight(2);
  fill(183, 153, 122);
  float inc2 = (360/minValue);
  pushMatrix();
  translate(width/2, height/2);
  for (float i=0; i<359; i+=inc2) {
    rotate(radians(inc2));
    if (minValue < 10) {
      randC = 1.5;
    }
    else {
      randC=20/minValue;
    }
    quad(x-24, y-r*.5+10*randC*random(-.5, 1.5), 
    x-10, y-r*.5-8*randC*random(-.5, 1.5), 
    x-17, y-r*.5+45*randC*random(.5, 1.5), 
    x-30, y-r*.5+27*randC*random(1, 1.5));
  }
  stroke(140, 122, 100);
  noFill();
  strokeWeight(5);
  translate(-width/2, -height/2);
  ellipse(x, y, r, r);
  popMatrix();
}
