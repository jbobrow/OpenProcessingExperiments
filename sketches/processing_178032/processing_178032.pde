
PGraphics mask;
int WHITE = color(255);
int BLACK = color(0);

void setup() {
  size(300, 300);
  noStroke();
  drawDemoMask();
}

void draw() {
  background(WHITE);
  fill(0, 100, 200);
  ellipse(mouseX, mouseY, 100, 100);
  maskPixels();
}

void drawDemoMask() {
  mask = createGraphics(width, height);
  mask.beginDraw();
  mask.background(0);
  mask.textSize(60);
  mask.textAlign(CENTER, CENTER);
  mask.text("Hiding\n behind\n words", 140, 140);
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
