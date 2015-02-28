
void setup() {
  size(400, 400);
  background(255);
  strokeWeight(5);
  smooth();
  stroke(0, 30);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  line(0, 0, width, height);
  noLoop();
}
void draw() {
  stroke(20, 50, 70);
  int step = 10;
  float lastx=-999;
  float lasty=-999;
  float x=width/2;
  int borderx = 20;
  int bordery = 0;
  for (int y=bordery; y<=height-bordery;y+=step) {
    x = random(width/2-borderx, width/2+borderx);
    if (lasty > -999) {
      line(x, y, lastx, lasty);
      line(y, x, lasty, lastx);
    }
    lastx = x;
    lasty = y;
  }
}


