
float fieldsize;
ArrayList <Pulse> pulseElems;

void setup() {
  size(500, 500);
  fieldsize = width/25;
  colorMode(HSB, 100);
  fill(0);
  noStroke();
  float theta;
  pulseElems = new ArrayList <Pulse> ();
  for (int i = int(fieldsize); i < width; i += fieldsize) {
    for (int j = int(fieldsize); j < height; j += fieldsize) {
      theta = random(PI);
      pulseElems.add(new Pulse(i, j, theta));
    }
  }
}


void draw() {
  background(100);
  for (int i = 0; i < pulseElems.size(); i ++) {
    Pulse pulseElem = pulseElems.get(i);
    pulseElem.display();
  }
}

class Pulse {
  float x, y, sz, theta;
  float c;

  Pulse(float _x, float _y, float _theta) {
    x = _x;
    y = _y;
    theta = _theta;
  }

  void display() {
    translate(x, y);
    sz = map(sin(theta), -1, 1, .8*fieldsize, 1.2*fieldsize);
    c = 50;
    fill(70, c, c);
    ellipse(0, 0, sz, sz);
    theta += 0.03;
    resetMatrix();
  }
}
