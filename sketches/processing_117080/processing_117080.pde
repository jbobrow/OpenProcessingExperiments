
//NOISE WIGGLY LINE 02
//TCY

void setup() {
  size(600, 100);
  noLoop();
}

void draw() {
  background(255);

  stroke(20, 50, 70);
  float step = 20;
  float nlevel = 0.1;
  float lastx = 20;
  float lasty = 50;
  float ynoise = random(20);
  float y;
  int border = 20;
  for (int x=border; x<=width-border;
x+=step) {
  step=noise(ynoise)*30;
      y = 10 + noise(ynoise)*90;
    stroke(20, 50, noise(ynoise), random(250));
    strokeWeight(noise(ynoise)*random(9));
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
    ynoise += nlevel;
  }
}



