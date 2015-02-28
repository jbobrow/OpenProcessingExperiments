
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hyeri Jeong
// ID: 201420107

void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background(255);

  noStroke();
  fill(230, 167, 255);
  ellipse(500, 500, 150, 150);

  //hour-big pink ellipse

  noStroke();
  fill(255, 0, hour()*4);
  ellipse(300, 300, hour()*25, 500);

  //minute-right rect

  stroke(0);
  strokeWeight(15);
  fill(200, 255, 0);
  rect(350, 5, 40, minute()*10);

  //second-left rect

  stroke(0);
  strokeWeight(15);
  fill(100, 100, 255);
  rect(200, 5, 40, second()*10+10);  
  stroke(0);
  strokeWeight(15);
  fill(100, 100, 255);
  rect(150, 5, 40, second()*10+10);
}

