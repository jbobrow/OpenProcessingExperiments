
ArrayList<Emitter> peep = new ArrayList();
void setup() {
  size(600, 300);
}
void draw() {
  background(-1);
  for (int i=0; i<1;i++)
  {
    Emitter E = new Emitter(new PVector(mouseX, mouseY));
    peep.add(E);
  }

  for (int j=0;j<peep.size();j++)
  {
    Emitter e = (Emitter) peep.get(j);
    e.display();
    e.update();
  }
}

class Emitter {
  PVector loc, acc;
  color c;
  float r;
  Emitter(PVector loc1) {
    loc = loc1;
    acc = new PVector(random(-1, 1), random(-1, 1));
    c = (color) random(#000000);
    r = random(20);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, r, r);
  }

  void update() {
    loc.add(acc);
  }
}

