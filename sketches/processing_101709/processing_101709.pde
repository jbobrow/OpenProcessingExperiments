
float a = 0;
float b = 0;
float co = 0;

void setup() {
  background(0);
  colorMode(HSB, 100);
  size(800, 600);
  smooth();
  strokeWeight(3);
}

void draw() {
  stroke(co, 80, 80, 20);

  float x0 = map(sin(a), -1, 1, width/5, width - width/5);
  float y0 = map(cos(a)*1.5, -1, 1, height/5, height - height/5);

  float x1 = map(sin(b), -1, 1, width/5, width - width/5);
  float y1 = map(cos(b), -1, 1, height/5, height - height/5);

  line(x0, y0, x1, y1);

  a = a + 0.04;
  b = b + 0.05;
  
  if (a > 24) {
    noLoop();
  }
  
  co = co + 1;
  if (co > 100) {
    co = 0;
  }
}
