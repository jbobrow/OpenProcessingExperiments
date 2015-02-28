
void setup() {
  size(800, 200);
  noLoop();
}

void draw() {
  background(255);
  smooth();


  for (int i=1; i<width; i+=100) {
    perfume (i, 100, int(random(244, 100)), random(5, 4));
  }
}

void perfume (float x, float y, float a, float b) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  strokeWeight(2);
  fill(30);
  rect(50, 40, 40, 15);
  fill(80);
  rect(55, 55, 30, 20);
  fill(random(255), random(255), random(255));
  rect(40, 70, 60, 80);
  noStroke();
  fill(b);
  rect(40, 70, 40, 40);
  popMatrix();
}



