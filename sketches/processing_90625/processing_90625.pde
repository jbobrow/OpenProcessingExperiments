
void setup() {
  size(100, 100);
  smooth();
  noStroke();
  background(255, 0, 100);
}

void draw() {
 // background(0);
  float s = map(second(), 0, 60, 0, 100);
  float m = map(minute(), 0, 60, 0, 100);
  float h = map(hour(), 0, 24, 0, 100);
  //line(s, 0, s, 33);
  //line(m, 34, m, 66);
  //line(h, 67, h, 100);
  fill(0, 50);
  ellipse (width/2, height/2, h, h);
  fill(130, 50);
  ellipse (width/2, height/2, m, m);
  fill (255, 50);
  ellipse (width/2, height/2, s, s);
}
