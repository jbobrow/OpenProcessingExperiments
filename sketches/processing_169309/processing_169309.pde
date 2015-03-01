
void setup() {
  size(640, 640);
  noStroke();
  fill(255, 0, 0, 50);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= 360; i+=12) {
    float x = sin(radians(i+frameCount));
    float y = cos(radians(i+frameCount));
    vertex(x*mouseY, y*mouseY);
    for (int q = 0; q < 360; q+=12) {
      float x3 = sin(radians(i+q+frameCount))*mouseX;
      float y3 = cos(radians(i+q+frameCount))*mouseX;
      vertex(x3, y3);
    }
  }
  endShape();
}



