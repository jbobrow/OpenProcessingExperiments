
// Homework 3, 01-23-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu January 2013 Pittsburgh PA 15232

float x, y; 
float r = 100; 
float value = 200;

void setup() {
  size(400, 400);
  noStroke();
  x = width / 2;
  y = height / 2;
  smooth();
}

void draw() {
  
  fill(0, 5);
  rect(0, 0, width, height);

  noStroke();
  fill(255, value, 0);
  ellipse(x, y, r, r);
   
  fill(100); 
  ellipse(x-.2*r, y-.2*r, .1*r, .2*r);
  ellipse(x+.2*r, y-.2*r, .1*r, .2*r);
   
  stroke(100);
  strokeWeight(3);
  fill(0, 150);
  beginShape();
    curveVertex(x+.6*r, y-.4*r);
    curveVertex(x-.4*r, y);
    curveVertex(x, y+(.2-value/2000)*r);
    curveVertex(x+.4*r, y);
    curveVertex(x-.6*r, y-.4*r);
  endShape();

  line(x-.4*r, y, x+.4*r, y);
  
  if (abs(mouseX - x) < r &&
      abs(mouseY - y) < r) {
    x += random(-6, 6);
    y += random(-6, 6);
    value = value - 5;
    if((.2-value/2000)*r>.5*r){
    value = -500;
    }
  }
  
  if (abs(mouseX - x) > r &&
      abs(mouseY - y) > r) {
    value = value + 3;
    if ((.2-value/2000)*r < 0){
      value = 400;
    }
  } 
}
