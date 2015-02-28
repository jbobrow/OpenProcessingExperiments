
// Study by Wiggle line
// Chun Yi Wu


void setup() {
  background(255);
  size(1200, 270);
  frameRate(10);
}

void draw() {
  //background(255);
  strokeWeight(1);
  int step = 10;
  float nlevel = 0.5;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(10);
  float y;
  int border = 20;
  for (int x=border; x<=width-border;
x+=step) {
      y = 20 + noise(ynoise)*270;
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
    stroke(x/3, 100, y*2, 15);
  }
}



