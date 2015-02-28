
//////////////// Animal //////////////
class  Animal {
  public PVector pos, vel, acc;
  public PVector vecAcc, vecVel;
  int radius;
  float maxSpeed;
  float friction;
 
  Animal() {
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
 
    vecAcc = new PVector(0, 0);
    vecVel = new PVector(0, 0);
 
    radius = 5;
    maxSpeed = 5;
    friction =  0.05;
  }
 
 
  void drawVector(PVector v, PVector loc, float scal) {
    float len = v.mag()*scal;
    line(loc.x, loc.y, loc.x+v.x*scal, loc.y+v.y*scal);
  }
 
  public void pursue(PVector target) {
    acc.add(target);
  }
  public void evade(PVector target) {
    acc.sub(target);
  }
 
  public void wander() {
    if (abs(vel.x) < abs(vel.y)) pursue(new PVector(random(-10, 10), 0));
    else pursue(new PVector(0, random(-10, 10)));
  }
 
  public void update() {
 
    vecAcc.set(acc);
    acc.normalize();
 
    vel.add(acc);
 
    //    vel.x += vel.x * -friction;
    //    vel.y += vel.y * -friction;
 
    vecVel.set(vel);
    vel.limit(maxSpeed);
 
    pos.add(vel);
    acc.set(0, 0, 0);
 
    //    acc.set(0,0,0);  //brzda
 
    ////// BOUNCE //////////
    //if ((pos.x+radius>width)  || (pos.x-radius<0)) vel.x *= -1;
    //if ((pos.y+radius>height) || (pos.y-radius<0)) vel.y *= -1;
    ////// BOUNCE //////////
 
    ////// SEAMLESS //////
    if (pos.x>width)  pos.x = 0;
    if (pos.x<0)      pos.x = width;
    if (pos.y>height) pos.y = 0;
    if (pos.y<0)      pos.y = height;
    ////// SEAMLESS //////
  }
}


