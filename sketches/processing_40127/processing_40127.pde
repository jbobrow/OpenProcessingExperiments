
ArrayList lins;
int parts = 200;
int thickness = 3;
int lengthOfPart = 2;

void setup() {
  size(640, 480, P2D);
  smooth();
  lins = new ArrayList(); 

  for (int i = 0; i < parts; i++) {
    lins.add(new Ciara(new PVector(mouseX, mouseY)));
  }

  background(250);
}

void draw() {
  background(250);

  for (int i = 0; i < lins.size(); i++) {
    Ciara lin = (Ciara) lins.get(i);
    stroke(map(i, 0, parts, 255, 0), 0, map(i, 0, parts, 0, 255));

    if (i==0) lin.update(new PVector(mouseX, mouseY));
    else {
      Ciara last = (Ciara)lins.get(i-1);
      lin.update(last.B);
    }
    lin.draw();
  }
}

class Ciara {
  float len = lengthOfPart;
  PVector A, B, eq;

  Ciara(PVector followTo) {
    A = new PVector();
    A.set(followTo);
    B = new PVector();
    B.set(followTo);
    B.mult(len);
    eq = new PVector(0, 0);
  }

  void update(PVector followTo) {
    A.set(followTo);
    B.sub(A);
    B.normalize();
    B.mult(len);
    B.add(A);
  }

  void draw() {
    pushStyle();
    strokeWeight(thickness);
    line(A.x, A.y, B.x, B.y);
    popStyle();
  }
}


