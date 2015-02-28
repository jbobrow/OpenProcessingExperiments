
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Written by Sasa Zivkovic 
// No.mad discourse | www.nomaddiscourse.com
// No.mad process | www.nomadprocess.com
// Inspired by example 7-15 (Spirals) from "Getting started with Processing"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
float angle = 0.0;
float offset = 200;
float scalar = 2;
float speed1 = 0.9;
float speed2 = 0.02;
float diameter = 2;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 500);
  background(255);
  noFill();
  smooth();
  strokeWeight(0.3);
  
  ///// "klick me" text
  fill(0);
  textSize(7);
  text("klick me", 15, 13);
  noFill();
  fill(0);
  noStroke();
  ellipse(10, 10, 4, 4);
  noFill();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  frameRate(200);
  stroke(100, 100);
  
  ///// draw spiral
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  diameter = map(mouseX, 0, 1000, 2, 200);
  float increase = map(mouseX, 0, 1000, 0.01, 0.9);
  ellipse(x, y, diameter, diameter);
  
  ///// change direction of spiral growth
  if (mousePressed) {
    angle -= speed1;
    scalar -= speed2 + increase;
  } else {
    angle += speed1;
    scalar += speed2 + increase;
  }
  
  ///// rounded rectangles 
  fill(255);
  noStroke();
  beginShape();
  int v = 10;
  vertex(width-v, 0);
  bezierVertex(width-v/2, 0, width, 0+v/2, width, v);
  vertex(width, 0);
  endShape();
  beginShape();
  vertex(v, 0);
  bezierVertex(v/2, 0, 0 , v/2, 0, v);
  vertex(0, 0);
  endShape();
  beginShape();
  vertex(v, height);
  bezierVertex(v/2, height, 0 , height- v/2, 0, height - v);
  vertex(0, height);
  endShape();
  beginShape();
  vertex(width-v, height);
  bezierVertex(width-v/2, height, width, height-v/2, width, height-v);
  vertex(width, height);
  endShape();
  noFill();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

