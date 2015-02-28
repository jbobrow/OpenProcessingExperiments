
// Wiggle Lines
// Line spacing
// lin wenyu  N76014118

void setup() {
  size(500, 500);
  //noLoop();
  background(255);
  frameRate(6);
}

void draw() {
  background(0);
  strokeWeight(5);

  float xstep = 10;
  float ystep = 10;
  float lastx = 20;
  float lasty = 50;
  float y = 50;
  int border = 30;
  for (int x=border; x<=width-border;x+=xstep) {
    stroke(random(255), random(255), random(255));
    ystep = random(30)-10;
    y += ystep;
    line(x, y, lastx+10, lasty);
    lastx = x;
    lasty = y;
  }
}



