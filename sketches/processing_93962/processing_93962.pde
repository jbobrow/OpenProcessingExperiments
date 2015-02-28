
void setup() {
  size(400,400);
  smooth();
  background(255);
}

void draw() {
  float r = random(0,255);
  fill(175);
  rectMode(CENTER);
 line(pmouseX,pmouseY,r,r);
}

void mousePressed() {
  background(255);
}



