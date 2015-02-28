
//source: http://blog.datasingularity.com/?p=362

ArrayList particles;
 Particle p1;
  
void setup() {
 size(500, 500);
 strokeWeight(4);
 
 smooth();
  
 particles = new ArrayList();
 p1 = new Particle();
 p1.location = new PVector(width/2, height/2-(height/4));
 p1.fixed = true;
 p1.mass = 20.0;
  
 particles.add(p1);
}
  
void draw() {
  background(0);
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    applyDissipativeForce(p, 0.01);
    applyAttractiveForce(p1, p, 500f, 50f);
    if(!p.exist()) {
      particles.remove(i);
    }
  }
}
  
void mousePressed() {
   stroke(223,1,116);
  fill(223,1,116);
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
      //velocity from direction and speed of mouse movement
      velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);
      acceleration = new PVector(0, 0, 0);
      mass =1;
      fixed = false;
  }
  
  public boolean exist() {
     if (fixed) {
       fill(0,59,223); //blue
       stroke(0,59,223);
     } else {
       velocity.add(acceleration);
       location.add(velocity);
       acceleration.mult(0);
       fill(0);
     }
     ellipse(location.x, location.y, 20, 20);
     return true;
  }
  
  void applyForce(PVector force) {
      acceleration.add(PVector.div(force, mass));
  }
  
}



