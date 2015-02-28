
// Generator
// http://boomkat.com/downloads/343268-keith-fullerton-whitman-generator
// (c) acd 2010

static final int STRIPES = 29;
static final int WIDTH = 10;
static final int GAPS = (STRIPES - 6);
static final float GAPRAD = (STRIPES * WIDTH * .2);

float bg, fg, bgd, fgd;
Gap[] gap = new Gap[GAPS];

void setup() {
  size(STRIPES * WIDTH, STRIPES * WIDTH);
  colorMode(HSB, 360, 100, 100);
  smooth();
  initStripes();
}

void initStripes() {
  int j = 0;
  for (int i = 3 ; i < STRIPES - 3 ; i++) {
    gap[j] = new Gap(i);
    j++;
  }
  bg = random(360);
  fg = random(360);
  bgd = random(-2, 2);
  fgd = random(-2, 2);
}

void draw() {
  fg = (fg + fgd + 360) % 360;
  bg = (bg + bgd + 360) % 360;
  color bgc = color(bg, 50, 100);
  color fgc = color(fg, 50, 100);
  background(bgc);
  fill(fgc);
  noStroke();
  for (int i = 1 ; i < STRIPES ; i += 2) {
    rect(i * WIDTH, 0, WIDTH, height);
  }
  for (int i = 0 ; i < GAPS ; i++) {
    if ((i & 1) == 0) {
      gap[i].draw(fgc, bgc);
    } else {
      gap[i].draw(bgc, fgc);
    }
  }
}

void mouseClicked() {
  initStripes();
}

class Gap {
  int x;
  float y;
  float angle, delta;
  float g2;  // second gap
  
  Gap(int _x) {
    x = _x;
    if ((x & 1) == 0) {
      // even = white, top half
      y = random(height * .2);
    } else {
      // odd = black, bottom half
      y = random(height * .8, height);
    }
    angle = random(2 * PI);
    delta = random(-.02, .02);
    if (random(10) < 3) {
      g2 = 2 * WIDTH * (int)random(1, 4);
    }
  }
  
  void draw(color c0, color c1) {
    angle += delta;
    float yy = y + GAPRAD * cos(angle);
    fill(c0);
    rect((x - 1) * WIDTH, yy, WIDTH, 20);
    fill(c1);
    ellipse((x - .25) * WIDTH, yy, WIDTH * 1.5, WIDTH * 1.5);
    ellipse((x - .25) * WIDTH, yy + WIDTH + WIDTH, WIDTH * 1.5, WIDTH * 1.5);
    if (g2 != 0) {
      yy += g2;
      fill(c0);
      rect((x - 1) * WIDTH, yy, WIDTH, 20);
      fill(c1);
      ellipse((x - .25) * WIDTH, yy, WIDTH * 1.5, WIDTH * 1.5);
      ellipse((x - .25) * WIDTH, yy + WIDTH + WIDTH, WIDTH * 1.5, WIDTH * 1.5);
    }
  }
}

