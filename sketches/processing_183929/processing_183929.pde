
ArrayList particles = new ArrayList();

float d = 128;

void setup() {
  size(640, 640);
  for (int x = 0; x <= width; x+=d) {
    for (int y = 0; y <= height; y+=d) {
      particles.add(new Particle(new PVector(x, y), random(0, d*4)));
    }
  }
}

void draw() {
  background(20);
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    p.move();
    p.changeVel();
    for (int q = 0; q < particles.size (); q++) {
      Particle p2 = (Particle) particles.get(q);
      float dist = PVector.dist(p.loc, p2.loc);
      if (dist < d*1.5) {
        stroke(255, 0, 255, map(dist, 0, d*1.5, 255, 0));
        strokeWeight(4);
        line(p.loc.x, p.loc.y, p2.loc.x, p2.loc.y);
        stroke(255, map(dist, 0, d*1.5, 255, 0));
        strokeWeight(1);
        line(p.loc.x, p.loc.y, p2.loc.x, p2.loc.y);
      }
    }
  }
  println(frameRate);
}

class Particle {
  PVector loc, vel;

  float num;

  Particle(PVector loc, float num) {
    this.loc = loc;
    vel = new PVector();
    this.num = num;
  }
  void move() {
    loc.add(vel);
  }

  void changeVel() {
    if (num < d) vel = new PVector(0.5, 0);   //Left
    if (num > d) vel = new PVector(0, 0.5);   //Down
    if (num > d*2) vel = new PVector(-0.5, 0); //Right
    if (num > d*3) vel = new PVector(0, -0.5); //Up
    if (num > d*4) num = 0;
    num++;
  }
}



