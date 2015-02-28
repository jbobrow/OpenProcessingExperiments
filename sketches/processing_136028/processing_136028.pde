
int radius = 50;

void setup() {
  size(800, 400);
  background(255);
  noLoop();
}

void draw() {
  int width_num = width / (radius * 2) + 1;
  int height_num = height / radius * 2 + 2;
  for (int i = 0; i < height_num; i++) {
    for (int j = 0; j < width_num; j++) {
      float wave_x = 2 * radius * (j + 0.5) - i % 2 * radius;
      float wave_y =  radius / 2 * (1 + i);
      wave(wave_x, wave_y);
    }
  }
}

void wave(float x, float y) {
  stroke(51, 51, 170);
  strokeWeight(5);
  fill(255);
  for (int i = 0; i < 4; i++) {
    arc(x, y, 2 * radius - radius / 2 * i, 2 * radius - radius / 2 * i, PI, TWO_PI);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("Blue_Wave.png");
  }
}


