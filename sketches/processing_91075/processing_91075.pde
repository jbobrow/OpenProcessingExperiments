
class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 

  Particle(PVector l) {
     location = new PVector(random(width),random(height));     
     lifespan = 120.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-2,2),random(-2, 0));
      
    velocity.mult(0.9);
    location.add(velocity);
      
      
      
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
    
    
    PVector mouse = new PVector(mouseX, mouseY);
    
    PVector distance = PVector.sub(mouse, location);

    
    float dist = location.dist(mouse);
    if(dist <5){
      lifespan=10;
    }

       fill(50,dist*0.8+frameRate*0.2);
       ellipse(location.x,location.y,dist*0.1,dist*0.1);


    PVector dir = PVector.sub(mouse, location);

    dir.normalize();

    dir.mult(0.03);

    acceleration = dir;
    
    
    
    
    if(location.x<0){
      location.x -= location.x;
    };
    if(location.x>width){
      location.x -= location.x;
    };
    if(location.y<0){
      location.y -= location.y;
    };
    if(location.y>height){
      location.y -= location.y;
    };
    
    
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
   
   smooth();
    noStroke();
    //stroke(0,lifespan);
    //strokeWeight(2);
  
   
 
    
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

float x = random(20,width-20);
 float y = random(20,height-20);

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
      
     
    
    
      if (p.isDead()) {
        particles.remove(p); 
      }
    }
  }
 
}





ParticleSystem ps;

void setup() {
  size(1200,800);
  ps = new ParticleSystem(width/2, height/2);

  
}

void draw() {
  background(255);
 
  float j=random(0.005,0.01);
  float h =random(0.0005,0.01);
  
 
 
  
  pushMatrix();
        
  translate(noise(frameCount*j-20)*width, noise(frameCount*h-20)*height);
  
  popMatrix();
  
   // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.001);
  ps.applyForce(gravity);
  
  ps.addParticle();
  ps.run();
}


