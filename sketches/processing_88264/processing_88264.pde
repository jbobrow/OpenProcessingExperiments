
void setup() {
  size (400, 400);
}

void draw() {
  float a = 0.0;
  float inc = TWO_PI/50.0;
  for (int i = 0; i < width*4; i++) {
    for (int j = 0; j < height; j += 100) {
      fill (j+cos(a)*50, j+cos(a)*30, j+cos(a)*10);
    rect(i*4, j+cos(a)*5, j*4, i+cos(a)*5);
    a = a + inc;
    }
  }
}




