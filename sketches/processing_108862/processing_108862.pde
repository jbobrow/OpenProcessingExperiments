
ArrayList rings;
float howMany= 10;
float x, y;
float sz = 0;
boolean kill = false;
int j = 0;

void setup() {
  smooth();
  size(400, 400);
  background(0);
  noFill();
  stroke(255);

  rings = new ArrayList();
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);
  for (int i = 0; i < rings.size() ; i ++) {
    Pulse ring = (Pulse) rings.get(i);
    ring.display();
    if (kill) {
      rings.remove(j);
      kill = false; 
    }
  }

  if (frameCount == 1) {
    rings.add(new Pulse(x, y, sz));
  }
  if (frameCount % 75 == 0) {
    rings.add(new Pulse(x, y, sz));
  }
}

void mouseClicked() {
  //setup();
  //rings.add(new Pulse(x, y, sz));
}

class Pulse {
  float x, y;
  float sz, store_sz;
  float theta=0;

  Pulse(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
    store_sz = _sz;
  }

  void display() {

    translate(x, y);
    ellipse(0, 0, sz, sz);
    resetMatrix();
    sz +=1;

    if (sz>sqrt(sq(width)+sq(width))) {
      kill = true;
    }
  }
}
