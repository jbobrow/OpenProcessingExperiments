
void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(0);
  float d = dist(width/2, height/2, mouseX, mouseY);
  ellipse(width/2, height/2, d*2, d*2);
  fill(200, 20, 90, 90);
  rect(width/4, height/4, d*2, d*2);
  fill(20,202,200, 90);
}



