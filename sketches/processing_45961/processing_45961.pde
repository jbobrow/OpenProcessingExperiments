
class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  int radius = 10;

  Particle() {
    pos = new PVector();
    vel = new PVector();
    acc = new PVector();
  }


  void setPos(int x, int y, float vx, float vy) {
    pos.x = x;
    pos.y = y;
    vel.x = vx;
    vel.y = vy;
  }

  void draw() {
    fill(255);
    ellipse(pos.x, pos.y, radius, radius);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
  }
}


