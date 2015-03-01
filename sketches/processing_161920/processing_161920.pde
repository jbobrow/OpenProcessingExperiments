
// Day_1 Sketch from james_yuxi_cao


float offset = 250; // claim position variable 
float speed = 0.02;// claim increment variable 
float nnnn = 0;// claim noise variable 


void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  
  nnnn = nnnn + .01;
  float n = noise(nnnn) * 255;  // claim float n color variable
  float wid =noise(nnnn) * width*1.5; // claim noise width
 
//  saveFrame("output/frames#################.tif");

  fill(n,random(0,10));
  //noStroke();
  stroke(255-n);
  strokeWeight(0.2);
  ellipse(offset, offset, wid, wid);
  
  rectMode(CENTER);
  stroke(n);
  fill(255-n,random(0,20));
  rect(offset,offset,wid,wid);
}
