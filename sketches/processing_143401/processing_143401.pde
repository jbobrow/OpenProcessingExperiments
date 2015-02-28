
/*
Konkuk University
SOS iDesign

Name: Gwang il Lee
ID: 201420094

*/
void setup() {
  size(600, 600);
  smooth();
  background(255,0,0);
}
void draw() {
  for (int i = 20; i< width; i = i + 40) {
    for (int j = 20; j< width; j = j + 40) {
      strokeWeight(3);
      stroke(0, 0, 0); 
      noFill();
      rectMode(CENTER);
      rect(i, j, 40, 40);
      strokeWeight(2);
      stroke(255);
      fill(0);
      ellipse(i, j, 30, 30);
      noFill();
      fill(255);
      ellipse(i,j,11,11);
      noFill();
      fill(255,150,0);
      strokeWeight(4);
      ellipse(i,j,10,10);
      }
  }
}

