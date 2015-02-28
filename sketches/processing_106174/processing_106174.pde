
float degrees;
float hues;
float degreem;
float huem;
float d;
float a;
float degreeh;
float hueh;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  colorMode(HSB, 255);
  d=0;
}

void draw() {
  background(0);
  strokeWeight(3);
  degrees=map(second(), 0, 59, 45, 45+359);
  hues = map(second(), 0, 59, 0, 255);
  a = map(second(), 0, 59, 0, height);
  degreem=map(minute(), 0, 59, 45, 45+359);
  huem = map(minute(), 0, 59, 0, 255);
  degreem=map(hour(), 0, 59, 45, 45+359);
  huem = map(hour(), 0, 59, 0, 255);
  //ellipse(width/2,height/2,3,3);
  text(second(), 0, 10);

  //minute rect
  pushMatrix();
  noStroke();
  fill(200, 255, 255, 175);
  translate(width/2, height/2);
  rotate(radians(degreem));
  rect(0, 0, 150, 150);
  popMatrix();

  //hour rect
  pushMatrix();
  noStroke();
  fill(150, 255, 255, 130);
  translate(width/2, height/2);
  rotate(radians(degreeh));
  rect(0, 0, 120, 120);

  popMatrix();
  
  //second rect;
  pushMatrix();
  stroke(hues, 255, 255, 200);
  noFill();
  translate(width/2, height/2);
  rotate(radians(degrees));
  rect(0, 0, a, a);
  popMatrix();
//  
//  //hour line
//  pushMatrix();
//  stroke(hueh, 255, 255);
//  translate(width/2, height/2);
//  rotate(radians(degreeh-90));
//  line(0, 0, 0, 50);
//  popMatrix();
//
//  //minute line
//  pushMatrix();
//  stroke(huem, 255, 255);
//  translate(width/2, height/2);
//  rotate(radians(degreem-90));
//  line(0, 0, 0, 100);
//  popMatrix();
}
