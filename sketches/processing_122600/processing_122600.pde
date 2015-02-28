
ArrayList<Orbit> poop = new ArrayList();
void setup() {
  size(400, 400);
  background(-1);
}
void mousePressed() {
  Orbit O = new Orbit(width/2, height/2, random(10, 200));
  poop.add(O);
}

void draw() {
  // background(0);
  noStroke();
  fill(-1, 20);
  rect(0, 0, width, height);
  for (int i=0; i<poop.size();i++) {
    Orbit O = (Orbit) poop.get(i);
    O.display();
    O.update();
  }
}

class Orbit {
  int locx, locy;
  float radius, i=0.0, v, r;
  color c;
  Orbit(int locx, int locy, float radius) {
    this.radius = radius;
    this.locy = locy;
    this.locx = locx;
    c = (color) random(#000000);
    v = random(0.5, 2);
    r = random(1, 10);
  }

  void display() {
    float x = locx+radius*sin(radians(i)); 
    float y = locy+radius*cos(radians(i));
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
  }

  void update() {
    i=i+v;
    if (i>360)i=0;
  }
}

