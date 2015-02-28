
void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB,255);
}

void draw() {
  background(0);
  smooth();
  
  //-----------------------start translate-----------------
  pushMatrix();
  translate (width/2, height/2); // to the center
  
  //hour
  strokeWeight(5);
  stroke(255);
  pushMatrix();
  rotate(radians (30*hour()));
  line(0, 0, 0, -50);
  popMatrix();

  //minute
  strokeWeight(5);
  stroke (160);
  pushMatrix();
  rotate(radians (6*minute ()));
  line(0, 0, 0, -90);
  popMatrix();

  //seconds
  strokeWeight (2);
  stroke(180);
  pushMatrix();
  rotate(radians (6*second ()));
  line(0, 0, 0, -115);
  popMatrix();
  popMatrix();
  //-----------------------end translate-----------------
  
  //background circle
  strokeWeight(1);
  fill(random(0,255), 255, 255, 30);
  float s = map(second(), 0, 59, 0, 200);
  ellipse(width/2, height/2, s, s);
  fill(random(0,255),255 , 255, 30);
  float m = map(minute(), 0, 59, 0, 200);
  ellipse(width/2, height/2, m, m);
  fill(random(0,255), 255, 255, 30);
  float h = map(hour(), 0, 23, 0, 200);
  ellipse(width/2, height/2, h, h);
}
