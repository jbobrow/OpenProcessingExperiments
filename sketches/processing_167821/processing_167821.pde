
void setup() {
  size(800, 500);
  colorMode(HSB, 360, 100, 100, 100);
  background(220, 70, 40);
  frameRate(0.4);
}

int nextPX = 0;
int nextPY = 0;

void draw() {
  int size = height/2;
  patch(nextPX*size, nextPY*size, size, size);
  nextPX += 1;
  if (nextPX * size >= width) {
    nextPY += 1;
    nextPX = 0;
  }
  if (nextPY * size >= height) {
    nextPY = 0;
  }
}

int clamp(n,a,b) {
  return min(b, max(a, n));
}

void lineClip(x, y0, w, h, clipY0, clipH) {
  int y1 = y0 + h;
  if (y0 < clipY0) y0 = clipY0;
  if (y1 < clipY0) y1 = clipY0;
  if (y1 < y0) return;
  rect(x, clamp(y0, clipY0, clipY0+clipH), w, (y1-y0));
}

void patch(int x0, int y0, int width, int height) {
  noStroke();
  
  hueBase = 215 + random(25);
  hueBase2 = 220 + random(10);
  hueMetaRange = random(30);
  fill(hueBase2, 60 + random(20), random(80), 80);
  rect(x0, y0, width, height);
  for (int x = x0; x < x0+width; x += 2) {
    seed = random(2*PI);
    hueRange = random(hueMetaRange);
    whitePhase = random(2*PI);
    whiteRange = random(15);
    for (int y = y0-x; y < y0+height; y += 9) {
      fill(hueBase+hueRange*sin(seed + 7*y/height),85,80+whiteRange*sin(whitePhase + 7*y/height),50);
      lineClip(x, y, 1, 5, y0, height);
      lineClip(x, y+9-2, 1, 1, y0, height);
    }
  }
}
