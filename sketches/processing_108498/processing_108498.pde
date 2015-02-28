
ArrayList dots;
float dots_row = 20;
float incr;
float start;
int i=0;
boolean one_off = false;
 
void setup() {
 
  size(600, 400);
  background(100);
  noStroke();
 
  incr = width/dots_row;
 
  dots = new ArrayList();
 
  for (int y = int(- incr/2); y < height *1.3; y+= .9*incr) {
    if (one_off) {
      start = -incr/2;
      
    }
    else {
      start = 0;
      
    }
    for (int x = int(start); x < width ; x += incr) {
      dots.add(new Pulse(x, y));
      i++;
    }
  }
}
 
void draw() {
  background(100);
  i=0;
  for (int x = int(- incr/2); x < width; x += incr) {
    for (int y = 0; y < height *1.3; y+= incr) { 
      Pulse dot = (Pulse) dots.get(i);
      dot.display();
      i++;
    }
  }
}
 
class Pulse {
  float x, y;
  float sz, sz2;
  float theta=0;
  float offset;
 
  Pulse(float _x, float _y) {
    x = _x;
    y = _y;
    offset = .8*incr;
    noStroke();
  }
 
  void display() {
 
    fill(0);
    translate(x+offset, y);
    sz = map(sin(theta), -1, 1, 0, incr);
    ellipse(0, 0, sz, sz);
    resetMatrix();
 
    fill(255, 0, 0);
    translate(x+ offset, y + offset*1.1);
    sz2 = incr - abs(sz);
    ellipse(0, 0, sz2, sz2);
    resetMatrix();
 
    theta += 0.04;
  }
}
