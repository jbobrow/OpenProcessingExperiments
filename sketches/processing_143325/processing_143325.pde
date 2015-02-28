
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Min Kyung Kim 
// ID:201420065 

float angle; 

void setup() {
  size(600, 600);
  smooth();
  background(0);
}

void draw() {

  translate(width/2, height/2);
  angle += 0.04;
  rotate(angle*1);
  strokeWeight(0);
  fill(random(255), random(255), random(255),80);
  rectMode(CENTER);
  rect(20, 20, 300, 300);
  
}



