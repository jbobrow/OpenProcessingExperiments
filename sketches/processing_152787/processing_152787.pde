
PVector v;

void setup(){
  size(900,400);
  background(0);
  v = new PVector(0.0, 0.0);
}

void draw() {
  v.lerp(mouseX, mouseY, 0.0, 0.1);
  stroke(0);
  ellipse(v.x, v.y, 20, 20);
  fill(255, 255, 255, 50);
}
