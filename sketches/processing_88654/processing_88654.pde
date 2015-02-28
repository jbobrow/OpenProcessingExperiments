
void setup() {
  size (500, 500);
  smooth();


  //w = width
  //h = height
  background(255, 255, 255);
  for (int i=25; i<1000; i+=50) {
    for (int j=25; j<1000; j+=50) {
      float w = random(10, 50);
      float h = random(10, 50);
      float r = random(255);
      float g = random(255);
      float b = random(255);
      float s = random(0,4);
      float a = random(50, 255);
      drawClock(i, j, w, h, r, g, b, a, s);
    }
  }
}

void drawClock(float i, float j, float w, float h, float r, float g, float b, float a, float s) {
  ellipseMode(CENTER);
  fill(r, g, b, a);
  strokeWeight(s);
  ellipse(i, j, w, h);
  line(i, j, i+w/2-5, j);
  line(i, j, i, j-h/2+h/5);
}



