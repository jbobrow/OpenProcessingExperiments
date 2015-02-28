
triLife T;
PImage cap;

void setup(){
  size(500,500);
  cap = loadImage("press-r.png");
  smooth();
  T = new triLife(50);
  T.setEdge();
  T.init();
  clear();
  T.plot();
}

void draw() { }

void clear() {
  background(255);
  image(cap, 0, 460);
}

void keyPressed() {
  if (key=='R' || key=='r') {
    T.init();
    clear();
    T.plot();
  } else {
    T.step();
    clear();
    T.plot();
  }
}


