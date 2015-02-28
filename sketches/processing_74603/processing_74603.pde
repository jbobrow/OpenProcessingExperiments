
color
  lcd0 = color(255, 0, 0),
  lcd1 = color(0, 255, 0),
  lcd2 = color(0, 0, 255),
  gray = color(32),
  black = color(0);

void setup() {
  size(512, 512);
  noSmooth();
}

void draw() {
  background(0);
  strokeWeight(0);
  randomSeed(0);
  loadPixels();
  int n = width * height;
  for(int i = 0; i < n; i++) {
    int row = i / width;
    pixels[i] = (row % 2 == 0) ?
      (i % 2 == 0 ? gray : black) :
      (i % 2 == 0 ? black : gray);
  }
  updatePixels();
  for(int i = 0; i < 32; i++) {
    float offset = frameCount + random(0, 10000);
    float speed = random(100, 5000);
    float x = map(sin(offset / speed), -1, 1, 0, width);
    verticalSubpixel(x);
  }
}

void verticalSubpixel(float x) {
  switch(int(x * 3) % 3) {
    case 0: stroke(lcd0); break;
    case 1: stroke(lcd1); break;
    case 2: stroke(lcd2); break;
  }
  line(x, 0, x, height);
}
