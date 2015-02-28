
ParticleSystem ps, ps1;
  
void setup() {
  size(800, 400, P3D);
  ps = new ParticleSystem(width/2, height/2);
  //ps1 = new ParticleSystem2(width/2, height/2 );
}
  
void draw() {
  background(255);
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  PVector hoho= new PVector(0.35*sin(radians(frameCount)), 0);
    
   
  ps.applyForce(gravity);
  ps.applyForce(hoho);
  
  //ps.addParticle(new Particle(ps.origin));
  ps.addParticle(new Confetti(ps.origin));
  ps.addParticle(new Cls1(ps.origin));
    
  ps.run();
    
  ps.origin.x=mouseX;
  ps.origin.y=mouseY;
  
//  ps1.applyForce(gravity);
//
//
//  ps1.addParticle(new Confetti(ps1.origin));
//  //ps1.addParticle(new Daniel(ps1.origin));
//ps1.run();
}
  
 
  
  
 
class Cls1 extends Confetti {
    
  float rotation,rotationSpd;
  int col;
  Cls1(PVector l) {
    super(l);
    rotationSpd = random(-1,1);
    rotation = random(0,360);
  }
  
  void display() {
  
    stroke(0, lifespan);
    strokeWeight(lifespan/1000);
  
    pushMatrix();
    translate(location.x, location.y);
    translate(25, 25);
    col = color(random(255),random(255),random(255),random(255));
    fill(255, 255, 255, lifespan);
    translate(-25, -25);
    rotate(radians(rotation));
    bezier(85, 20, 10, 10, 90, 90, 15, 80);
    //rect(0, 0, lifespan/10, lifespan/10);
    popMatrix();
      
    rotation = rotation + rotationSpd;
  }
}
class Confetti extends Particle {
  Confetti(PVector l) {
    super(l);
  }
  
  void display() {
    stroke(0, lifespan);
    strokeWeight(lifespan/1000);
    fill(lifespan);
    ellipse(location.x, location.y, 10, 10);
  }
}
 class Particle {
    
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1;
  
  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1),random(-2, 0));
  }
  
  void run() {
    update();
    display();
  }
  
  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
    
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass); 
    acceleration.add(f);
  }
    
     
  
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan*10);
    bezier(30, 20,  80, 5,  80, 75,  30, 75);
    //ellipse(location.x,location.y,12,12);
  }
    
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < random(80,100)) {
    velocity = new PVector(random(3, 5), random(-20, 0));
  }
  
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
 
import java.util.*;
  
class ParticleSystem {
    
  ArrayList<Particle> particles;
    
  PVector origin;
  
  ParticleSystem(float x, float y) {
    origin = new PVector(x,y);
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(Particle p) {
    particles.add(p);
        
  
  }
    
  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
    
  void run() {
      
   for (int i = particles.size()-1; i > 0; i--) {
  
      Particle p = particles.get(i);
      p.run();
        
      if (p.isDead()) {
        particles.remove(p);
      }
    }
  }
   
}
 
class ParticleSystem2 extends ParticleSystem {
    
    
  ParticleSystem2(float x, float y) {
    super(x,y);
     
  }
  
    
  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    PVector fb=new PVector(f.x, -f.y);
    for (Particle p: particles) {
      p.applyForce(fb);
    }
  }
}

