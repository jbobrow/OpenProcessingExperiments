

void setup() {
  size(600,300);
  background(255);
  noFill();
  stroke(0,35);
  smooth();
  frameRate(15);
}
void draw() {
  float x = random(50);
  ellipse(mouseX,mouseY,x,x);
}

