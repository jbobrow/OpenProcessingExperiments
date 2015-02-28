
class Agent {
  PVector pos;
  PVector vel;
  PVector acc;
  
  float fr;
  
  int life;
  int age;
  
  float mass;
  
  PVector[] locs;
  PVector[] vels;
  int counter;
  
  float lratio_;
  float mratio_;
  
  Agent(float m, PVector p, PVector v, int l) {
    pos = p;
    vel = v;
    life = l;
    mass = m;                                                                                                                                                                                     
    
    age = 0;
    
    locs = new PVector[50];
    vels = new PVector[50];
    counter = 0;
    
    mratio_ = m / 100;
  }
  
  void update() {
    vel.add(acc);
    vel.mult(fr);
    pos.add(vel);
    
    acc.set(0, 0, 0);
    age++;
    lratio_ = (float)age/life;
    
    if (frameCount % 2 == 0 && counter < locs.length) {
      locs[counter] = pos.get();
      vels[counter] = vel.get();
      counter++;
      
      if (counter == locs.length) counter = 0;
    }
  }
  
  boolean isDead() {
    return (age == life);
  }
  
  void draw() {
    float r;
    color c;
    
    for (int i = 0; i < counter; i++) {
      c = color(noise(pos.x) * 32 + 64 * sin(frameCount) / 10, 
        noise(pos.x) * cos(pos.y) * 64, 
        sin(frameCount) * noise(pos.x, pos.y) * 128 + 32, 
        lerp(4 * mratio_, 0, lratio_));
      
      r = noise(i) * mratio_ * 10 + 8 * cos(frameCount) * map(mratio_, 0.2, 2, 1, 0.1);
      
      drawDot(c, r, locs[i]);
    }
  }
  
  void drawDot(color c, float r, PVector p) {
      noStroke();
      fill(c);
      
      ellipseMode(CENTER);
      ellipse(p.x, p.y, r, r);
  }
}

