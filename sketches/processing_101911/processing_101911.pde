
int x = 80;
int y = 30;
int w = 80;
int h = 60;
int enterCounter = 0;
int lowerBitMask = 255;
int maxCounter = lowerBitMask;

void setup() {
  size(240, 120);
  colorMode(HSB);
}

void draw() {
  if (mousePressed) {
    lowerBitMask = 7;
    maxCounter = lowerBitMask;
  } else {
    lowerBitMask = 255;
    maxCounter = lowerBitMask;
  }
  
  background(204);
  if ((mouseX > x) && (mouseX < x+w) &&
      (mouseY > y) && (mouseY < y+h)) {
    enterCounter = (enterCounter + 1) & lowerBitMask;
    fill(map(enterCounter, 0, maxCounter, 0, 255), 255, 255);
  } else {
    fill(255);
  }
  rect(x, y, w, h);
}


