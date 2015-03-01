
PGraphics mask;
int WHITE = color(255);
int BLACK = color(255);
int e = 5;

void setup() {
  size(300, 300);
  background(WHITE);
  drawDemoMask();
}

float y;
float yDif;

void draw() {
  stroke(0, 3);
  for (int i=0; i<10; i++) {
     y = random(300);
     yDif = random(-70, 70);
     line(0,y, 300, y+yDif);
  }
  noStroke();
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
