
class Fire {
  PVector pos;
  PVector vel;
  PVector accel;
  int radius = 10;
  int ttl = 120;
  int trans = 100;
  int randcolor;
  
  Fire() {
    pos = new PVector();
    vel = new PVector();
    accel = new PVector();
  }
  
  void setPos(int x, int y, float vx, float vy) {
    pos.x = x;
    pos.y = y;
    vel.x = vx;
    vel.y = vy;
    randcolor = int(random(0, 3));
  }
  
  void draw() {
    if (randcolor == 0) {
      fill(255, 0, 0, trans);
      ellipse(pos.x, pos.y, radius-4, radius-4);
    }
    if (randcolor == 1) {
      fill(255, 165, 0, trans);
      ellipse(pos.x, pos.y, radius-2, radius-2);
    }
    if (randcolor == 2) {
      fill(255, 80, 0, trans);
      ellipse(pos.x, pos.y, radius, radius);
    }
    noStroke();
  }
  
  boolean burnout() {
    if (ttl >= 0) {
      trans -= 2;
    }
    
    if (ttl < 0) {
      return true;
    }
    ttl -= 1;
    return false;
  }
  
  void update() {
    vel.add(accel);
    pos.add(vel);
    
    if (vel.x > 0) {
      vel.x = vel.x -= 0.1;
    }
    
    if (vel.x < 0) {
      vel.x = vel.x += 0.1;
    }
  }
}

