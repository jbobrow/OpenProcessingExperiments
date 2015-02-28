
class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float max_vel = 40;
  int defaultLifeTime = 300;
  int lifeTime = defaultLifeTime;
  int taille = 2;
  float bounce;
  
  // line
  PVector last_pos;
  color c;
  
  // Particle_Line  
  Particle (PVector p, PVector v, PVector a, float b ) {
    // super(p, v, a, b);  
    last_pos = p.get();
    lifeTime = int (random(100, 150));
  }

  Particle (PVector p, PVector v, PVector a) {
    pos = p.get();
    vel = v.get();
    acc = a.get();
  }

  Particle (PVector p, PVector v) {
    pos = p.get();
    vel = v.get();
    acc = new PVector(0, 0);
  }

  Particle (PVector p) {
    pos = p.get();
    vel = new PVector(random(-2, 2), random (-2, 2));
    acc = new PVector(0, 0);
  }

  void update() {
    vel.add(acc);
    vel.limit(max_vel);
    pos.add(vel);
    lifeTime--;
    if(pos.x >= 500 || pos.x <= 0) {
    }
  }

  // line
  void render_line() {
    stroke(c, lifeTime);
    line(pos.x, pos.y, last_pos.x, last_pos.y);
    last_pos=pos.get();
  }
  
  void render() {
    update();
    ellipse (pos.x, pos.y, taille, taille);
  }

  boolean life() {
    if (lifeTime < 0) return false;
    else return true;
  }
}

