
void setup() {
  size(500, 500);
  frameRate(100);
}

float xoff = 0.0;
float c = 0;

void draw() {
  c = c + .005;
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  /*noStroke();
   fill(255, 2);
   rect(0, 0, width, height);*/
  translate(250, 250);
  rotate(c);
  stroke(0);
  line(0, 0, n/2, n/2);
  if (c > 6.3) {
    background(200);
    c = 0;
  }
}

