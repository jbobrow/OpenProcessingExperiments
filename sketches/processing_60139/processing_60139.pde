
//hack of Matt Pearson's code from Generative Art: A Practical Guide Using Processing
PGraphics pg;
void setup() {
  colorMode(HSB);
  background(255);
  size(600, 400);
}
void draw() {
  colorMode(HSB);
  background(255);
  smooth();
  for (int i=0; i<4000; i++) {//draws many lines
    pushMatrix();
    rotate(random(0, 2*PI));
    translate(random(0, 300), random(0, 300));
    stroke(int(random(0, 10)), int(random(120, 255)), int(random(84, 255)));
    int step = 10;
    float lastx = -209;
    float lasty = -209;
    float ynoise = random(10);
    float y;
    for (int x=0; x<=4000; x+=step) {
      y = 0 + noise(ynoise) * 80;  // between 10 and 90
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
      ynoise += 0.1;
    }
    noLoop();
    popMatrix();
  }
}


