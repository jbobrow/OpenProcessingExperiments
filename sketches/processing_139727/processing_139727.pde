
{
  size(400, 400);
 
  background(255);
  noFill();
  noStroke();
  colorMode(HSB, 360, 100, 100);
  smooth();
 
  float radius = width/3;
  float diameter = radius*2;
 
  float centerX = width/2;
  float centerY = height/2;
 
  float sqr1s = diameter/sqrt(2);
  float sqr2s = sqr1s/2;
  float sqr3s = radius;
 
  fill(30, 100, 95);
  float per1S = radius/(5f/3);
 
  pushMatrix();
  translate(centerX, centerY);
 
  pushMatrix();
  for (int i=0; i<8; i++) {
    rotate(i*radians(45));
 
    pushMatrix();
    translate(sqr1s/2, 0);
 
    ellipse(0, 0, per1S, per1S);
    popMatrix();
  }
  popMatrix();
 
  fill(35, 60, 100);
  float per2S = per1S/1.5;
 
  pushMatrix();
  rotate(radians(22.5));
 
  for (int i=0; i<8; i++) {
    rotate(i*radians(45));
 
    pushMatrix();
    translate(sqr3s/2, 0);
 
    ellipse(0, 0, per2S, per2S);
 
    popMatrix();
  }
  popMatrix();
 
  fill(60, 33, 98);
  float per3S = per1S/2;
   
  pushMatrix();
  for (int i=0; i<8; i++) {
    rotate(i*radians(45));
 
    pushMatrix();
    translate(sqr2s/2, 0);
 
    ellipse(0, 0, per3S, per3S);
    popMatrix();
  }
  popMatrix();
 
  fill(30, 0, 100);
  float per4S = per2S/2;
 
  pushMatrix();
  rotate(radians(22.5));
 
  for (int i=0; i<8; i++) {
    rotate(i*radians(45));
 
    pushMatrix();
    translate(sqr2s/3, 0);
 
    ellipse(0, 0, per4S, per4S);
    popMatrix();
  }
  popMatrix();
 
  float dotSize = radius/5;
 
  fill(45, 70, 50);
 
  ellipse(0, 0, dotSize, dotSize);
 
  popMatrix();
 
 
}

