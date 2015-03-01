
PGraphics mask;
int WHITE = color(255);
int BLACK = color(255);
int e = 5;

void setup() {
  size(300, 300);
  noStroke();
  background(WHITE);
  drawDemoMask();
}

void draw() {
  fill(255, 20);
  rect(0, 0, 300, 300);
  if (keyPressed) {
    if (key == 'z') {
      e += 5;
    }
    if (key == 'x') {
      e -= 5;
    }
  }
  if (e < 5) {
    e=5;
  }
  if (e > 210) {
    e = 210;
  }
  for (int i=0; i<(105/(e/2)); i++) {
    fill(0, random(100, 200), random(100, 200));
    ellipse(random(300), random(300), e, e);
  }
  maskPixels();
}

void drawDemoMask() {
  mask = createGraphics(width, height);
  mask.beginDraw();
  mask.background(0);
  mask.ellipse(width/2, height/2, 250, 250);
  mask.endDraw();
  mask.loadPixels();
}

void maskPixels() {
  loadPixels();
  for (int i=0; i < mask.pixels.length; ++i) {
    int maskPixel = mask.pixels[i];
    if (maskPixel != WHITE) {
      pixels[i] = BLACK;
    }
  }
  updatePixels();
}

