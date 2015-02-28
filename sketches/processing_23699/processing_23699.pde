
class Pot {
  PVector pos;
  PVector vel;
  
  boolean accel;
  
  Pot() {
    pos = new PVector(width*.5,20);
    vel = new PVector(0,0);
    
    accel = false;
  }
  
  void update() {
    pos.add(vel);
    
    if (accel) vel.y+=.1;
    
    PVector ice = new PVector(-vel.x,-vel.y);
    ice.div(100);
    vel.add(ice);
  }
  
  void display() {
    strokeWeight(2);
    stroke(0);
    fill(255,255,0);
    ellipse(pos.x,pos.y,10,10);
  }
}

