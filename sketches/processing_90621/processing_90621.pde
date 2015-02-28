
void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(200);
  fill(255, 200);
  noStroke();
  float d = dist(width/2, height/2, mouseX, mouseY);
  fill(0, 80, 180, 170);
  ellipse(width/2, height/2, d*2, 80);
  fill(0, 200, 100, 170);
  ellipse(width/2, height/2, 80, d*2);
}
