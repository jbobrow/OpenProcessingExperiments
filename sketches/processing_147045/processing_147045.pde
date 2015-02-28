
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Min Kyung Kim
// ID: 201420065


float angle; 

void setup() {
  size (600, 600);
  smooth() ;
}

void draw() {
  drawClock();
}

void drawClock() {
  //green
  fill(#0B7C0C);
  stroke(#0B7C0C);
  quad(236, 599, 279, 599, 308, 320, 285, 318);

  //M
  stroke(255, 0, 0);
  strokeWeight(5);
  fill(255);
  ellipse(300, 300, 50, 50);
  strokeWeight(3);

  //second
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*second()));
  fill(#FA551E);
  stroke(#FA551E);
  bezier(0, 0, 189, 250, 150, 174, 0, 0);
  popMatrix();

  //minute
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(6*minute()));
  fill(#FCF8A1);
  stroke(#FCF8A1);
  bezier(0, 0, 182, 350, 87, 243, 0, 0);
  popMatrix();

  //hour
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(30*hour()));
  fill(#FCF8A1);
  stroke(#FCF8A1);
  bezier(0, 0, 182, 200, 87, 243, 0, 0);
  popMatrix();
}

