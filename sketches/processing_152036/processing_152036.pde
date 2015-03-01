
ArrayList<Particle> poop = new ArrayList();
void setup() {
  size(400, 400);
  for (int i=0; i<100; i++) {
    float r = random(50);
    Particle P = new Particle(random(r, width-r), random(r, height-r), r);
    poop.add(P);
  }
}

void draw() {
  background(-1);
  for (int i=0; i<poop.size (); i++) {
    Particle P = poop.get(i);
    P.show();
    P.move();
    P.drawLines();
  }
}
boolean push=false;
void keyPressed() {
  push=!push;
}
class Particle {
  float x, y, xc, yc, theta, dt, r;
  Particle(float xc, float yc, float r) {
    this.xc = xc;
    this.yc = yc;
    this.r = r;

    if (dt!=0) {
      dt = dt;
    } else {
      dt = random(-1, 1);
    }
  }
  void show() {
    x = xc + r*cos(theta*PI/180);
    y = yc + r*sin(theta*PI/180);
    fill(0);
    ellipse(x, y, 2, 2);
    if (push) {
      fill(0,10);
      noStroke();
      ellipse(xc, yc, 2*r, 2*r);
    }
  }
  void move() {
    theta+=dt;
  }
  void drawLines() {
    for (int i=0; i<poop.size (); i++) {
      Particle P = poop.get(i);
      if (P!=this) {
        if (dist(x, y, P.x, P.y)<50)
        {
          stroke(0,20);
          line(x, y, P.x, P.y);
        }
      }
    }
  }
}
//Mausa 8726593531
