
ParticleSystem ps;
PImage img;
PImage img1;


void setup() {
  size(500,500);
  ps = new ParticleSystem(0, 0);
  img1=loadImage("water.png");
  img=loadImage("fire.png");
  smooth();
  background(0);
}

void draw() {  
   // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.001);
 ps.applyForce(gravity);
  
  ps.addParticle();
  ps.run();
}
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  //float lifespan;
  float mass = 1; 
  float xwhat= 0.0;

  Particle(PVector l) {
    location = l.get();
    //lifespan = 255.0;
    acceleration = new PVector((random(0.5)),(random(0.5)));
    //acceleration = new PVector(0,0.5);
    xwhat=xwhat+ 0.5;
    velocity = new PVector(noise(xwhat)*0.1, noise(xwhat)*0.1);
    
  
}

  void run() {
    update();
    display();
    display1();
   // display2();

    
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  
    acceleration.mult(0);
    //lifespan -= 0.5;
    
    if (location.x > width) {
    location.x = 0;
    }
    if (location.y > height) {
    //location.y = 0;
    }
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    //stroke(0, lifespan);
    strokeWeight(2);
    //fill(127,lifespan);
    tint(255,126);
    image(img, location.x, location.y, 20, 20);
   
  }
  
   void display1() {
   // stroke(0, lifespan);
    strokeWeight(2);
    //fill(127,lifespan);
    pushMatrix();
   //translate(270,-180);
   // rotate(PI-90);
    tint(255,126);
    image(img1, location.x, location.y, 20, 20);
    popMatrix();
    
  }

 //  void display2() {
   // stroke(0, lifespan);
   // strokeWeight(2);
    //fill(127,lifespan);
   // pushMatrix();
  // translate(270,-240);
    //rotate(PI-90);
   // tint(255,126);
    //image(img,location.x, location.y, 40, 60);
    //popMatrix();
    
 // }
  
    
  
  // Is the particle still useful?
  //boolean isDead() {
  //  if (lifespan < 0.0) {
    //  return true;
  //  } 
   // else {
    //  return false;
   // }
 // }
}
import java.util.*;

class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x,y);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
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
      
     // if (p.isDead()) {
      //  particles.remove(p); 
     // }
    }
  }
 
}






