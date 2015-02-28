
//Original, code von http://blog.datasingularity.com/?p=362

ArrayList particles;
 
Particle a;
 
void setup() {
 size(800, 600);
 stroke(0);
 strokeWeight(3);
 fill(150);
 smooth();
 
 particles = new ArrayList();
 
 a = new Particle();
 a.location = new PVector(width/2f, height/2f);
 a.fixed = true;
 a.mass = 5.0;
 
 particles.add(a);
}
 
void draw() {
  background(255);
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    // experiment w/ different friction coefficients
    applyDissipativeForce(p, 0.01);
    //experiment with strength and minDistance, try a minDistance below 30
    applyAttractiveForce(a, p, 500f, 50f);
    if(!p.exist()) {
      particles.remove(i);
    }
  }
}
 
void mouseDragged() {
  particles.add(new Particle());
}
 
void applyDissipativeForce(Particle p, float friction) {
  PVector f = PVector.mult(p.velocity, -friction);
  p.applyForce(f);
}
 
void applyAttractiveForce(Particle a, Particle b, float strength, float minDistance) {
  PVector dir = PVector.sub(a.location, b.location);
  float d = dir.mag();
  if (d < minDistance) d = minDistance;
  dir.normalize();
  float force = (strength * a.mass * b.mass) / (d * d);
  dir.mult(force);
  if (!b.fixed) b.applyForce(dir);
  if (!a.fixed) {
    dir.mult(-1f);
    a.applyForce(dir);
  }
}
 
public class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean fixed;
 
  public Particle() {
      location = new PVector(mouseX, mouseY);
      //get velocity from direction and speed of mouse movement
      velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);
      acceleration = new PVector(0, 0, 0);
      mass = 1;
      fixed = false;
  }
 
  public boolean exist() {
     if (fixed) {
       fill(255,0,0);
     } else {
       velocity.add(acceleration);
       location.add(velocity);
       acceleration.mult(0);
       fill(150);
     }
     ellipse(location.x, location.y, 10, 10);
     return true;
  }
 
  void applyForce(PVector force) {
      acceleration.add(PVector.div(force, mass));
  }
 
}
