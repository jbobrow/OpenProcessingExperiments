
class Ball {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float rad = 30;
  color c = 0;
  boolean dead = false;
  
  Ball() {
    pos.x = random(0,width);
    pos.y = random(0,height);
    vel.x = random(0,5);
    vel.y = random(0,5);
  }
  
  void update() {
  
    if ( pos.y + rad > height ) vel.y = abs(vel.y) * -1;
    if ( pos.y - rad < 0 )      vel.y = abs(vel.y);
    if ( pos.x + rad > width )  vel.x = abs(vel.x) * -1;
    if ( pos.x - rad < 0 )      die();
    
    pos.add(vel);
  }
  
  void display() {
    fill(c); noStroke(); ellipseMode(RADIUS);
    ellipse(pos.x,pos.y,rad,rad);
  }
  
  void die() {
    dead = true;
  }
  
  boolean isDead() {
    return dead;
  }
}

