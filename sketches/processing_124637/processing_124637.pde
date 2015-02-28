
ArrayList<Circles> poop =new ArrayList();
int t=0;
void setup() {
  size(400, 400);
  noStroke();
  for (int i=0;i<9000;i++) {
    PVector P = new PVector(random(-200, 200), random(-200, 200));
    PVector G = new PVector(width/2, height/2);
    P.add(G);
    if (P.dist(G)<150)
    { 
      Circles C = new Circles( P, random(1, 100), random(1, 50));
      poop.add(C);
    }
  }
}

void draw() {
  background(0);
  if (t < poop.size()) {
    for (int i=0;i<t;i++) {
      Circles C = (Circles) poop.get(i);
      C.display();
    }
  }
  else t=0;
  fill(0);
  ellipse(width/2, height/2, 200, 200);
  t++;
}

class Circles {
  PVector loc;
  float l, r;
  Circles(PVector loc, float l, float r) {
    this.loc = loc;
    this.l = l;
    this.r =r;
  }

  void display() {
    fill(-1, l);
    ellipse(loc.x, loc.y, r, r);
  }
}

