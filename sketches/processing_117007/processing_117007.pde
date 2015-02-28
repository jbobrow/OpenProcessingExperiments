
// practice of wiggled line by randomness 10/23
// by chen-hisn chang

void setup() {
  size(500, 100);
  noLoop();
}
void draw() {
  background(255);
  strokeWeight(1);
  stroke(20, 50, 70);
 
  int step = 20;
  float lastx = -999;
  float lasty = -999;
  float lasty2 = -999;
  float y = 50;
  float y2 = 50;
  int border = 20;
  int bordery = 40;
  int bordery2 = 30;
  for (int x=border; x<=width-border; x+=step) {
    y = bordery+random(height-2*bordery);
    y2= bordery+random(height-2*bordery2);
    if (lastx > -999) {
      stroke(20,lastx/2,lastx/2);
      triangle(x, y, lastx, lasty,lastx+step/2, lasty2);
    }
    lastx = x;
    lasty = y;
    lasty2 = y2;
  }
}



