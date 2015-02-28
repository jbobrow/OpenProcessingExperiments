
void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  smooth();
}

void draw() {
  background(0, 0, 100);
  float angle = map(dist(mouseX, mouseY, width / 2, height / 2), 0, width / 2, 0, PI);
  noStroke();
  for(int i = 10; i > 0; i--) {
    fill(i * 10, 100, 100);
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(i * frameCount * 0.5));
    arc(0, 0, i * 50, i * 50, 0, angle);
    popMatrix();
  }
  pushMatrix();
  translate(width / 2, height / 2);
  fill(0, 0, 100);
  ellipse(0, 0, 25, 25);
  popMatrix();
  
  //if (mousePressed) saveFrame("frame_###.png");
}


