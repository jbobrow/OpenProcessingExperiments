
float space = 20;
float sz = 5;
float rec = 0;


void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  fill(255);
  
  rec += TWO_PI / 100;
  float i = 0;
  
  for (float x = space * .5; x < width; x += space + sz) {
    for (float y = space * .5; y < width; y += space + sz) {
      i++;
      float rx = cos(rec + i) * 10 + x;
      float ry = sin(rec + i) * 10 + y;
      ellipse(rx, ry, sz, sz);
    }
  }
}
