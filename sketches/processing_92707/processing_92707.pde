
/* @pjs preload="bg1.jpg"; 
@pjs preload="raindrop.png";
@pjs preload="leaf.PNG";
 */

ParticleSystem ps;

PImage img;

void setup() {
  size(353,575);
  img = loadImage("bg1.jpg");
  ps = new ParticleSystem(width/2, -20);
}

void draw() {
  background(img);
  //frameRate(10);
  
   // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  PVector wind = new PVector(0.05*sin(radians(frameCount)),0);
  
  ps.applyForce(gravity);
  ps.applyForce(wind);
  
  PVector origin2 = new PVector(230,310);
  PVector origin3 = new PVector(30,100);
  
  ps.addParticle(new ConfettiR(origin3));
  ps.addParticle(new ConfettiF(origin2));
  ps.addParticle(new ConfettiB(ps.origin));
  ps.run();
}
class ConfettiB extends Particle {
  
   PImage img = loadImage("raindrop.png"); 
  
   ConfettiB(PVector l) {
    super(l);
    velocity = new PVector(random(-3, 3),random(-.5, .5));
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2;
    
    if (location.y>height-15) {
      velocity.y *= -.8;
      image(img,location.x,location.y,10,5);
    }

    
    if (location.x>width-5) {
      velocity.x *= -.8 ;
      image(img,location.x,location.y,3,18);
    }
    
    if (location.x<0){
      velocity.x*= -.8;
      image(img,location.x,location.y,3,18);
    }
    
  }
  
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(167,lifespan);
    noStroke();
    
    tint(255, lifespan);  
    image(img,location.x,location.y,5,10);
  }
  
}
class ConfettiF extends Particle {
  float mass = 6;
 
   ConfettiF(PVector l) {
    super(l);
    lifespan = 130;
  }
  
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(255,lifespan);
    noStroke();
    ellipse(location.x,location.y,10,10);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }
  
}
class ConfettiR extends Particle {
  float mass = 1;
  PImage img = loadImage("leaf.PNG");
  
  ConfettiR(PVector l) {
    super(l);
    lifespan = 200;
  }

  void display() {
    angle+=angleUpdate;
    pushMatrix();
      translate(location.x, location.y);
      translate(7,4);
      rotate(lifespan/angle);
      translate(-7,-4);
      tint(255,lifespan);
      image(img,0,0,14,8);
    popMatrix();
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }
}

class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  float angle;
  float angleUpdate;

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1),random(-2, 0));
    angle = random(50,200);
    angleUpdate = random(-5, 5);
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
    lifespan -= 1;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    //stroke(0,lifespan);
    //strokeWeight(2);
    //fill(127,lifespan);
    //ellipse(location.x,location.y,12,12);
  }
  
  // Is the particle still useful?
  boolean isDead() {
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







