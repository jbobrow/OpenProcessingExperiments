
void setup() {
  size(500, 500);
  background(0);
  frameRate(5000);
  noLoop();
}


void draw() {
  stroke(0);
  fill(random(80,255), 0, 0);
  ellipse(random(100, 400), random(100, 400), 2.5, 2.5);
  stroke(0);
  fill(0, random(100, 150), 0);
  ellipse(random(100, 400), random(100, 400), 2, 2);
  stroke(0);
  fill(0, 0, random(100, 255));
  rect(random(100, 400), random(100, 400), 2, 2);

}

void mousePressed() {
  background(0);
  loop();
}



