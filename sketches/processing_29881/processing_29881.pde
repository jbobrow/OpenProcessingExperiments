
class Rectangle {
  
  float a;
  PVector pos;
  PVector acc;
  PVector vel;
  
  Rectangle(float xin, float yin) {
    a = c*c;
    pos = new PVector(xin,yin);
    acc = new PVector(0,0);
    vel = new PVector(0,0);
  }
  
  void draw() {
    noStroke();
    fill(255,40);
    rectMode(CENTER);
    rect(pos.x,pos.y,c,c);
  }
  
  void update() {
    vel.add(acc);
    vel.mult(friction);
    pos.add(vel);
    acc.mult(0);
  }
  
  void frame() {
    if (pos.x<c/2) {pos.x=c/2; acc.x*=-friction; vel.x*=-friction;}
    if (pos.x>width-c/2) {pos.x=width-c/2; acc.x*=-friction; vel.x*=-friction;}
    if (pos.y<c/2) {pos.y=c/2; acc.y*=-friction; vel.y*=-friction;}
    if (pos.y>height-c/2) {pos.y=height-c/2; acc.y*=-friction; vel.y*=-friction;}
  }
  
  void collide(Rectangle r2) {
    PVector force = PVector.sub(r2.pos,pos);
    float distance = force.mag();
    if (distance<c) {
      PVector force1 = force;
      float distance1 = distance;
      distance1 -= c;
      force1.normalize();
      force1.mult(distance1/2);
      force1.div(a/200);
      acc.add(force1);
      force1.mult(-1);
      r2.acc.add(force1);
    }
    if (abs(r2.pos.x-pos.x)<c-precision && abs(r2.pos.y-pos.y)<c-precision) {
      PVector force2 = force;
      float distance2 = distance;
      force2.normalize();
      force2.mult(3);
      force2.div(a/200);
      r2.acc.add(force2);
      force2.mult(-1);
      acc.add(force2);
    }
  }
  
}

