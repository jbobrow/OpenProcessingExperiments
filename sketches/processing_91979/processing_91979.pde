
//Creative Computing
//Fervido Frias
//March 5, 2013.

void setup() {
  background(0);
  size(400, 400);
  smooth();
  strokeWeight(2);
}

void draw() {
  translate(-69, -150);
  for (float i = 30; i < width-30; i += 5) {
    for (float e = 60; e <= height-88; e += 5) { 
      fill(423, 0, 0);
      ellipse(i*3, e*3, 6, random(6));
    }
  }
}



