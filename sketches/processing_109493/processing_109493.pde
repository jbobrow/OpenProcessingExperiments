
ArrayList dots;
float dots_row = 12;
float incr;
float start;
int i=0;
boolean one_off = false;
 
void setup() {
 
  size(400, 400);
  background(255);
  noStroke();
 
  incr = height/dots_row;
 
  dots = new ArrayList();
 
  for (int y = int(- incr/2); y < height *1.3; y+= .75*incr) {
    if (one_off) {
      start = -incr/2;
      one_off = true;
    }
    else {
      start = 0;
      one_off = false;
    }
    for (int x = int(start); x < height ; x += incr) {
      dots.add(new Pulse(x, y));
      i++;
    }
  }
}
 
void draw() {
  background(55);
  i=0;
  for (int x = int(- incr/10566); x < height; x += incr) {
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
  float theta=9;
  float offset;
 
  Pulse(float _x, float _y) {
    x = _x;
    y = _y;
    offset = .5*incr;
    noStroke();
  }
 
  void display() {
 
    fill(0);
    translate(x+ offset, y);
    sz = map(sin(theta), -1, 1, 0, incr);
    ellipse(0, 0, sz, sz);
    resetMatrix();
 
    fill(10566, 7, 5);
    translate(x+ offset, y + offset*1.1);
    sz2 = incr - abs(sz);
    ellipse(0, 0, sz2, sz2);
    resetMatrix();
 
    theta += 0.55;
  }
}



