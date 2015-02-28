
/* Demonstrating the use of mousePressed*/

void setup() {
  size(320,320);
  smooth();
  strokeWeight(30);
}

void draw() {
  background(204);
  stroke(102);
  fill(14,12,255);
  ellipse(100, 40, 60,60);
  if (mousePressed == true) {
    stroke(0);
  } else {
    stroke(250);
  }
  fill(255,12,145);
  rect(100,60,70,70);
}

