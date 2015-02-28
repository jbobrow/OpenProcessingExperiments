
//Homework 3
//Sabrina Li
//Copyright Sabrina Li January 2014 Pittsburgh, PA

float x, y, d, easing_coefficient;
boolean c;

void setup() {
  size(400, 400);
  x = width/8;
  y = height/8;
  d = width/8;
  
  easing_coefficient = 0.2;
  
  c = true;
  
  smooth();
  background(0, 0, 0);
  fill(mouseX, 240, 225, 80);
  
}

void draw() {
  
  fill(mouseX, 240, 225, 80);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  
  x = x + (dx * easing_coefficient);
  y = y + (dy * easing_coefficient);
  
  if (c == true) {
    frameRate(20);
    stroke(0, 0, 0);
    strokeWeight(1);
    ellipse(x, y, d, d);
  } else {
    frameRate(80);
    stroke(255, 255, 255, 100);
    strokeWeight(15);
    point(x, y);
  }  
}

void mousePressed() {
  if (c == true) {
    c = false;
  } else {
    c = true;
  }
  //saveFrame("hw3-####.jpg");
}

