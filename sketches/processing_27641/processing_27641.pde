
ArrayList particles;

Particle Move;

void setup() {

 size(400, 400); 
 noStroke();
 smooth();
 
 particles = new ArrayList();
 
 Move = new Particle();
 Move.location = new PVector(width/2f, height/2f);
 Move.fixed = true;
 Move.mass = 1.0;
 
 particles.add(Move);
}

void draw() {
  
  fill(#3A7A93,20);
  noStroke();
  ellipse(200,200,200,200);
  ellipse(200,200,300,300);
  ellipse(200,200,100,100);
  fill(#404F55,20);
  rect(0,0,400,400);
  fill(#FFB039);
  stroke(#FFB039);
 
  
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    applyDissipativeForce(p, 0.001);
    applyAttractiveForce(Move, p, 200f, 20f); 
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

void applyAttractiveForce(Particle Move, Particle b, float strength, float minDistance) {
  PVector dir = PVector.sub(Move.location, b.location);
  float d = dir.mag(); 
  if (d < minDistance) d = minDistance;
  dir.normalize(); 
  float force = (strength * Move.mass * Move.mass) / (d * d); 
  dir.mult(force);
  if (!b.fixed) b.applyForce(dir);
  if (!Move.fixed) {
    dir.mult(-1f);
    Move.applyForce(dir);
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
      velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);   
      acceleration = new PVector(0, 0, 0);
      mass = 1;
      fixed = false;
  }
 
  public boolean exist() {
     if (fixed) {
       fill(#1C9BFF); 
     } else {
       velocity.add(acceleration);
       location.add(velocity);
       acceleration.mult(0);
       fill(#FFF262);
     }
     ellipse(location.x, location.y, 3, 3); 
     return true;
  }
  
  void applyForce(PVector force) {
      acceleration.add(PVector.div(force, mass));
  }
    
}




