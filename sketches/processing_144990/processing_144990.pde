
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Youngjun
// ID: 201420083

PImage galaxy;

float x = 0;
float y = 0;
float xSpeed = 4;
float ySpeed = 2;
float i = 0;
float j = 0;
float iSpeed = 7;
float jSpeed = 5;
float angle;
float angleN = radians(0.1);
float c1 = 10;
float c1dir = 5;

void setup() {
  size(600, 600);
  smooth();
  galaxy = loadImage ("992.jpg");
}

void draw() {
  background(0);
  //Galaxy Background
  pushMatrix();
  translate(300, 300);
  rotate (-angle);
  noFill();
  imageMode(CENTER);
  image (galaxy, 0, 0);
  popMatrix();
  angle = angle + angleN;
  if ((angle > radians(360)) || (angle < radians(0))) {
    angleN = angleN * -1;
  }

  x = x + xSpeed;
  y = y + ySpeed;
  i = i + iSpeed;
  j = j + jSpeed;

  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }

  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }

  if ((i > width) || (i < 0)) {
    iSpeed = iSpeed * -1;
  }

  if ((j > height) || (j < 0)) {
    jSpeed = jSpeed * -1;
  }

  //Circles
  strokeWeight(10);
  stroke(255);

  float sd = second();

  if (sd==0) {
    ellipse (500, 150, x/3, x/3);
    ellipse (150, 500, x/3, x/3);
  }

  if (sd==30) {
    ellipse (100, 150, y/3, y/3);
    ellipse (500, 450, y/3, y/3);
  }

  if (i>j) {
    ellipse (300, 150, y/3, y/3);
    ellipse (300, 450, y/3, y/3);
  }

  if (j>i) {
    ellipse (150, 300, y/3, y/3);
    ellipse (450, 300, y/3, y/3);
  }


  //Center Shape
  strokeWeight(1);
  stroke(0);
  fill(x, y, 0, 100);
  triangle(width/2, 0+10*second(), x, y, width-x, height-y);
  fill(x, 0, y, 100);
  triangle(width/2, height-10*second(), x, y, width-x, height-y);
  fill(0, x, y, 100);
  triangle(0+10*second(), height/2, x, y, width-x, height-y);
  fill(y, x, 0, 100);
  triangle(width-10*second(), height/2, x, y, width-x, height-y);
  fill(y, 0, x, 100);
  triangle(0+10*second(), 0+10*second(), x, y, width-x, height-y);
  fill(0, y, x, 100);
  triangle(width-10*second(), 0+10*second(), x, y, width-x, height-y);
  fill(x+y, x-y, 0, 100);
  triangle(0+10*second(), height-10*second(), x, y, width-x, height-y);
  fill(0, x+y, x-y, 100);
  triangle(width-10*second(), height-10*second(), x, y, width-x, height-y);

  star(i, j);
}

void star(float a, float b) {
  fill(#af9f25, 100);
  pushMatrix();
  translate(a, b); 
  beginShape();
  ellipse(0, 0, 50, 50);
  endShape(CLOSE);
  rectMode(CORNERS);
  //tales
  rotate(10*angle);
  //hour
  fill(#282725);
  rect(60, -20, 60+(8.3*hour()), -10);
  //minute
  fill(#575956);
  rect(60, -5, 60+(3.3*minute()), 5);
  //second
  fill(#a4a6a3);
  rect(60, 10, 60+(3.3*second()), 20);  
  popMatrix();
}

