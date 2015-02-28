
void setup() {
  size(640, 480);
  frameRate(30);
}

void draw() {
  background(0);
  fill(31, 127, 255);
  float radius=150*sin(frameCount/10.0)+200;
  ellipse(width/2, height/2, radius, radius);
}



