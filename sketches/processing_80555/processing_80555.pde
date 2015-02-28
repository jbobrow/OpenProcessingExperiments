
Elipse n, m, l, i, j, k;
Diagonal a;

void setup() {
  background(234, 234, 234);
  size(612, 792);
  frameRate(12);

  n = new Elipse(40, 36, 100, 100);
  m = new Elipse(32, 12, 28, 17);
  l = new Elipse(30, 29, 46, 28);
  i = new Elipse(15, 12, 28, 17);
  j = new Elipse(10, 29, 46, 28);
  k = new Elipse(5, 216, 107, 64);

  a = new Diagonal(216, 107, 64);

  rectMode(RADIUS);
}

void draw() {

  a.update();
  a.display();

  n.update();
  n.display();
  m.update();
  m.display();
  l.update();
  l.display();
  i.update();
  i.display();
  j.update();
  j.display();
  k.update();
  k.display();

  if (mousePressed) {

    i.radius ++;
    j.radius++;
    k.radius++;
    l.radius++;
    m.radius++;
    n.radius++;
  }

  if (keyPressed) {
    if (key == 'g') {
      saveFrame("##.png");
    }
  }
}

class Diagonal {
  int rojo, verde, azul;


  Diagonal (int ro, int ve, int az) {

    rojo = ro;
    verde = ve;
    azul = az;
  }

  void update() {
    mouseX= mouseX+int (random(-4, 4));
    mouseY= mouseY+int (random(-4, 4));
  }

  void display() {

    stroke(rojo, verde, azul);
    strokeWeight(0.2);

    line(mouseY, mouseX, mouseX, mouseY);
  }
}

class Elipse {

  float radius;
  int rojo, verde, azul;

  Elipse (float r, int ro, int ve, int az) {
    rojo=ro;
    verde=ve;
    azul=az;
    radius = r;
  }

  void update() {

    radius= radius+random(-4, 4);

    if ((radius > 100) || (radius < -100)) {
      radius = 0;
    }
  }

  void display() {

    noFill();
    stroke (rojo, verde, azul, MULTIPLY);
    strokeWeight(0.4);
    ellipse(mouseX, mouseY, radius, radius);
  }
}
