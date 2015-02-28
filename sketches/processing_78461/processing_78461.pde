
class Particle{
  
  PVector pos;
  PVector vel;  
  PVector acc; 
  PVector force;
  float drag;
  float rad;
  float mass;
  int fllColor;
  
  public Particle(float m, PVector _pos){
   pos = _pos;
   vel = new PVector();
   acc = new PVector();
   force = new PVector();
   drag = 0.9f;
   rad = m;
   mass = m;
  }
  
  void run() {
    update();
    render();
  }  

  void update() {
   //vel.mult(drag);
   vel.add(force);
   pos.add(vel);
   force.div(mass);
   acc = new PVector();
   force = new PVector();
   vel.limit(0.7);
  }

 void add_force(PVector p) { 
    p.div(mass);
    vel.add(force);
  }  
  PVector getVelocity() {
    return vel;
  }
  void render() {
    noStroke();
    fill(fllColor);
    ellipse(pos.x, pos.y, rad*2, rad*2);
  }  


}

